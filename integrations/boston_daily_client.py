"""
Boston Daily ingest client for seo-controller (blog_bot.py) and the merchant sync job.

Usage from blog_bot.py, after a post is written and pushed to a site repo:

    from boston_daily_client import send_blog_post
    send_blog_post(
        site="flyhorizons.online",
        repo="shaheenarifch-arch/flyhorizons.online",
        path="blog/best-travel-pillows.json",
        sha=commit_sha,
        title=post["title"],
        body_html=post["html"],            # or body_markdown=...
        hero_image_url=post.get("hero"),   # only with hero_image_rights
        hero_image_rights="permitted_release",  # merchant creative supplied for promotion
        reviewer="Talha N. Ch",
    )

Environment:
    BOSTON_DAILY_URL      e.g. https://bostondaily.example.com
    BOSTON_DAILY_SECRET   same value as the Worker's INGEST_SECRET

Existing site publishing is unchanged; this only sends a copy to the newspaper's partner lane.
Posts that pass every policy gate publish automatically (labeled Affiliate); anything else waits
for an editor in the newsroom console.
"""
import hashlib
import hmac
import json
import os
import urllib.request


def _post(endpoint: str, payload: dict, timeout: int = 30) -> dict:
    base = os.environ["BOSTON_DAILY_URL"].rstrip("/")
    secret = os.environ["BOSTON_DAILY_SECRET"].encode()
    raw = json.dumps(payload, ensure_ascii=False).encode("utf-8")
    sig = hmac.new(secret, raw, hashlib.sha256).hexdigest()
    req = urllib.request.Request(
        f"{base}{endpoint}",
        data=raw,
        method="POST",
        headers={"content-type": "application/json", "x-signature": f"sha256={sig}"},
    )
    with urllib.request.urlopen(req, timeout=timeout) as res:
        return json.loads(res.read().decode("utf-8"))


def send_blog_post(*, site, title, repo=None, path=None, sha=None, body_html=None, body_markdown=None,
                   dek=None, section=None, hero_image_url=None, hero_image_rights=None,
                   author=None, reviewer=None, disclosure_text=None, sensitive=False) -> dict:
    payload = {k: v for k, v in {
        "site": site, "repo": repo, "path": path, "sha": sha, "title": title, "dek": dek,
        "body_html": body_html, "body_markdown": body_markdown, "section": section,
        "hero_image_url": hero_image_url, "hero_image_rights": hero_image_rights,
        "author": author, "reviewer": reviewer, "disclosure_text": disclosure_text, "sensitive": sensitive,
    }.items() if v not in (None, "")}
    return _post("/api/ingest/blog", payload)


def sync_products(merchants: list, products: list, full_sync: bool = False, sync_id: str = None) -> dict:
    """
    Push merchants + products from the master affiliate database.
    merchant: {network, network_merchant_id, name, publisher_account_id, display_name_allowed, section, website}
    product:  {network, network_merchant_id, external_id, name, deep_link, price, currency, image_url,
               image_rights_ok, section, is_deal, availability}
    Sends products in chunks of 200. full_sync only applies when the whole catalog fits in one chunk.
    """
    result = {"merchants": 0, "products": 0, "deactivated": 0, "errors": []}
    chunks = [products[i:i + 200] for i in range(0, len(products), 200)] or [[]]
    for i, chunk in enumerate(chunks):
        r = _post("/api/ingest/products", {
            "merchants": merchants if i == 0 else [],
            "products": chunk,
            # Full sync (deactivate anything missing) is only safe when everything fits in one request.
            "full_sync": full_sync and i == len(chunks) - 1 and len(chunks) == 1,
            "sync_id": sync_id,
        })
        result["merchants"] = max(result["merchants"], r.get("merchants", 0))
        result["products"] += r.get("products", 0)
        result["deactivated"] += r.get("deactivated", 0)
        result["errors"] += r.get("errors", [])
    return result


def sync_courses(courses: list) -> dict:
    """RealSkillSet catalog: [{title, type: owned|affiliate, url, category, section, level, duration, format, price}]"""
    return _post("/api/ingest/courses", {"courses": courses})


def sync_businesses(businesses: list) -> dict:
    """Business registry: [{slug, name, domain, group, section, short_description, featured, paid_listing}]"""
    return _post("/api/ingest/businesses", {"businesses": businesses})


if __name__ == "__main__":
    print(send_blog_post(site="example.com", title="Test post from blog bot",
                         body_markdown="A short partner guide with an [affiliate link](https://example.com) for testing the ingest endpoint."))
