/**
 * Editor auth: ADMIN_TOKENS secret = "Name:token,Name2:token2".
 * Each editor gets their own token so approvals are attributed to a real person.
 * Put Cloudflare Access in front of /admin and /api/admin for SSO in production.
 */
export async function authenticateEditor(request, env) {
  const header = request.headers.get('authorization') || '';
  const token = header.startsWith('Bearer ') ? header.slice(7).trim() : '';
  if (!token || !env.ADMIN_TOKENS) return null;
  for (const pair of String(env.ADMIN_TOKENS).split(',')) {
    const idx = pair.indexOf(':');
    if (idx < 1) continue;
    const name = pair.slice(0, idx).trim();
    const secret = pair.slice(idx + 1).trim();
    if (secret && (await timingSafeEqual(token, secret))) return { name, kind: 'human' };
  }
  return null;
}

/**
 * Ingest auth: X-Signature: sha256=<hex HMAC of raw body with INGEST_SECRET>.
 * Ingest callers are automated systems; they can never approve newsroom content.
 */
export async function verifyIngestSignature(request, rawBody, env) {
  if (!env.INGEST_SECRET) return false;
  const header = request.headers.get('x-signature') || '';
  const given = header.startsWith('sha256=') ? header.slice(7) : header;
  if (!given) return false;
  const expected = await hmacHex(env.INGEST_SECRET, rawBody);
  return timingSafeEqual(given.toLowerCase(), expected);
}

export async function hmacHex(secret, message) {
  const key = await crypto.subtle.importKey('raw', new TextEncoder().encode(secret), { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']);
  const sig = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(message));
  return [...new Uint8Array(sig)].map((b) => b.toString(16).padStart(2, '0')).join('');
}

async function timingSafeEqual(a, b) {
  const enc = new TextEncoder();
  const [ha, hb] = await Promise.all([
    crypto.subtle.digest('SHA-256', enc.encode(String(a))),
    crypto.subtle.digest('SHA-256', enc.encode(String(b))),
  ]);
  const va = new Uint8Array(ha);
  const vb = new Uint8Array(hb);
  let diff = 0;
  for (let i = 0; i < va.length; i++) diff |= va[i] ^ vb[i];
  return diff === 0;
}
