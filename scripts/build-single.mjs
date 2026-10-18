// Builds dist/worker.js: the whole Worker as one ES module with public/ files embedded,
// for deploying through the Cloudflare dashboard or API without the assets binding.
// Usage: node scripts/build-single.mjs
import { build } from 'esbuild';
import { readFileSync, readdirSync, statSync, mkdirSync, writeFileSync } from 'node:fs';
import { join, relative, extname } from 'node:path';

const root = new URL('..', import.meta.url).pathname;
const TYPES = { '.css': 'text/css; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.html': 'text/html; charset=utf-8', '.svg': 'image/svg+xml' };

function walk(dir) {
  return readdirSync(dir).flatMap((name) => {
    const p = join(dir, name);
    return statSync(p).isDirectory() ? walk(p) : [p];
  });
}

const assets = {};
for (const file of walk(join(root, 'public'))) {
  const path = `/${relative(join(root, 'public'), file).replace(/\\/g, '/')}`;
  assets[path] = { type: TYPES[extname(file)] || 'application/octet-stream', body: readFileSync(file, 'utf8') };
}
// /admin and /admin/ serve the console page.
if (assets['/admin/index.html']) assets['/admin/'] = assets['/admin/index.html'];

const result = await build({
  entryPoints: [join(root, 'src/index.js')],
  bundle: true, format: 'esm', platform: 'neutral', target: 'es2022', write: false, minify: false,
});

const wrapper = `
const __ASSETS = ${JSON.stringify(assets)};
const __worker = __bd_default;
export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    if (url.pathname === '/admin') return Response.redirect(url.origin + '/admin/', 301);
    const asset = (request.method === 'GET' || request.method === 'HEAD') && !url.hostname.startsWith('www.') ? __ASSETS[url.pathname] : null;
    if (asset) {
      const cache = url.pathname.startsWith('/admin') ? 'no-cache' : 'public, max-age=3600';
      return new Response(request.method === 'HEAD' ? null : asset.body, { headers: { 'content-type': asset.type, 'cache-control': cache, 'x-content-type-options': 'nosniff' } });
    }
    return __worker.fetch(request, env, ctx);
  },
  scheduled(event, env, ctx) { return __worker.scheduled(event, env, ctx); },
};
`;

let code = result.outputFiles[0].text;
// Rename the bundle's default export so the wrapper can delegate to it.
code = code.replace(/export\s*\{\s*([A-Za-z0-9_$]+)\s+as\s+default\s*\};?\s*$/, 'const __bd_default = $1;');
if (!code.includes('const __bd_default')) throw new Error('Could not find the default export in the bundle');

mkdirSync(join(root, 'dist'), { recursive: true });
writeFileSync(join(root, 'dist/worker.js'), code + wrapper);
// Schema + seed as one SQL file for the D1 console/API.
writeFileSync(join(root, 'dist/setup.sql'), readFileSync(join(root, 'migrations/0001_init.sql'), 'utf8') + '\n' + readFileSync(join(root, 'seed/seed.sql'), 'utf8'));
console.log(`dist/worker.js ${(code.length / 1024).toFixed(0)} KB, ${Object.keys(assets).length} embedded files`);
