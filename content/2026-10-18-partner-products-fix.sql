-- Partner products: hide items whose merchant image no longer loads (checked on the live site after launch). Loaded once.
UPDATE products SET status = 'inactive', updated_at = '2026-10-19T02:30:00.000Z' WHERE image_url IN (
  'https://everleakproof.com/cdn/shop/files/moderate_absorbency.jpg',
  'https://everleakproof.com/cdn/shop/files/heavy_absorbency_lilac.jpg',
  'https://cdn.shopify.com/s/files/1/0034/6947/5904/files/NRPK012-S-N-z1.jpg?v=1750751268&width=600',
  'https://cdn.shopify.com/s/files/1/0034/6947/5904/files/1_b5ffe3e3-93ca-4929-b01b-6ea245a09036.jpg?v=1750728990&width=600',
  'https://cdn.shopify.com/s/files/1/0629/8576/5122/files/astraea-pendant-light.jpg?v=1712940427',
  'https://images.unsplash.com/photo-1544551763-46a013bb70b5?q=80&w=1200&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1493558103817-58b2924b5715?q=80&w=1200&auto=format&fit=crop'
);
