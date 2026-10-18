import { esc, isHttpUrl } from './util.js';

/**
 * Minimal, safe Markdown → HTML for story bodies.
 * Everything is escaped first; only a small whitelist of constructs is produced.
 * Supports: ## / ### headings, paragraphs, - and 1. lists, > quotes, **bold**, *italic*, [text](https://url).
 * Raw HTML in the source is never passed through.
 */
export function renderMarkdown(src, { sponsoredLinks = false } = {}) {
  const lines = String(src || '').replace(/\r\n?/g, '\n').split('\n');
  const out = [];
  let para = [];
  let list = null; // { tag, items }
  let quote = [];

  const flushPara = () => {
    if (para.length) out.push(`<p>${inline(para.join(' '), sponsoredLinks)}</p>`);
    para = [];
  };
  const flushList = () => {
    if (list) out.push(`<${list.tag}>${list.items.map((i) => `<li>${inline(i, sponsoredLinks)}</li>`).join('')}</${list.tag}>`);
    list = null;
  };
  const flushQuote = () => {
    if (quote.length) out.push(`<blockquote><p>${inline(quote.join(' '), sponsoredLinks)}</p></blockquote>`);
    quote = [];
  };
  const flushAll = () => { flushPara(); flushList(); flushQuote(); };

  for (const raw of lines) {
    const line = raw.trimEnd();
    if (!line.trim()) { flushAll(); continue; }
    let m;
    if ((m = line.match(/^(#{2,3})\s+(.*)$/))) {
      flushAll();
      const level = m[1].length;
      out.push(`<h${level}>${inline(m[2], sponsoredLinks)}</h${level}>`);
    } else if ((m = line.match(/^\s*[-*]\s+(.*)$/))) {
      flushPara(); flushQuote();
      if (!list || list.tag !== 'ul') { flushList(); list = { tag: 'ul', items: [] }; }
      list.items.push(m[1]);
    } else if ((m = line.match(/^\s*\d+[.)]\s+(.*)$/))) {
      flushPara(); flushQuote();
      if (!list || list.tag !== 'ol') { flushList(); list = { tag: 'ol', items: [] }; }
      list.items.push(m[1]);
    } else if ((m = line.match(/^>\s?(.*)$/))) {
      flushPara(); flushList();
      quote.push(m[1]);
    } else {
      flushList(); flushQuote();
      para.push(line.trim());
    }
  }
  flushAll();
  return out.join('\n');
}

function inline(text, sponsoredLinks) {
  // Pull links out before escaping so their URLs can be validated.
  const tokens = [];
  const withPlaceholders = text.replace(/\[([^\]]+)\]\(([^)\s]+)\)/g, (_, label, url) => {
    tokens.push({ label, url });
    return `\u0000${tokens.length - 1}\u0000`;
  });
  let s = esc(withPlaceholders);
  s = s.replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>').replace(/\*([^*]+)\*/g, '<em>$1</em>');
  s = s.replace(/\u0000(\d+)\u0000/g, (_, i) => {
    const { label, url } = tokens[Number(i)];
    if (!isHttpUrl(url)) return esc(label);
    const rel = sponsoredLinks ? 'sponsored nofollow noopener' : 'noopener';
    return `<a href="${esc(url)}" rel="${rel}" target="_blank">${esc(label)}</a>`;
  });
  return s;
}

/**
 * Convert blog-bot HTML into the Markdown subset above. Scripts, styles, iframes and all
 * attributes except link hrefs are dropped, so nothing executable survives ingestion.
 */
export function htmlToMarkdown(input) {
  let s = String(input || '');
  s = s.replace(/<(script|style|iframe|noscript|svg|form|object|embed)[\s\S]*?<\/\1>/gi, '');
  s = s.replace(/<!--[\s\S]*?-->/g, '');
  s = s.replace(/<a\b[^>]*?href\s*=\s*["']([^"']+)["'][^>]*>([\s\S]*?)<\/a>/gi, (_, href, label) => {
    const text = label.replace(/<[^>]+>/g, '').replace(/\s+/g, ' ').trim();
    return text ? `[${text}](${href.trim()})` : '';
  });
  s = s.replace(/<h[12][^>]*>([\s\S]*?)<\/h[12]>/gi, '\n\n## $1\n\n');
  s = s.replace(/<h[3-6][^>]*>([\s\S]*?)<\/h[3-6]>/gi, '\n\n### $1\n\n');
  s = s.replace(/<li[^>]*>([\s\S]*?)<\/li>/gi, '\n- $1');
  s = s.replace(/<\/(ul|ol)>/gi, '\n\n');
  s = s.replace(/<(strong|b)\b[^>]*>([\s\S]*?)<\/\1>/gi, '**$2**');
  s = s.replace(/<(em|i)\b[^>]*>([\s\S]*?)<\/\1>/gi, '*$2*');
  s = s.replace(/<blockquote[^>]*>([\s\S]*?)<\/blockquote>/gi, (_, q) => `\n\n> ${q.replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ').trim()}\n\n`);
  s = s.replace(/<br\s*\/?>/gi, '\n');
  s = s.replace(/<\/(p|div|section|article|header|footer|figure|table|tr)>/gi, '\n\n');
  s = s.replace(/<[^>]+>/g, '');
  s = s.replace(/&nbsp;/g, ' ').replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&#39;/g, "'");
  return s.split('\n').map((l) => l.replace(/[ \t]+/g, ' ').trim()).join('\n').replace(/\n{3,}/g, '\n\n').trim();
}

/** Plain-text excerpt for meta descriptions and cards. */
export function excerpt(src, max = 180) {
  const text = String(src || '')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/^\s*(#{1,6}\s.*|[-*]\s+|\d+[.)]\s+)/gm, (m) => (m.trim().startsWith('#') ? '' : ''))
    .replace(/[#>*_`]/g, '')
    .replace(/\s+/g, ' ')
    .trim();
  return text.length > max ? `${text.slice(0, max - 1).trimEnd()}…` : text;
}
