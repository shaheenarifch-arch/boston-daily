-- Recommended businesses: AI tools stacked together first, then agencies and service providers. Loaded once.
UPDATE businesses SET grp = 'AI tools', updated_at = datetime('now') WHERE slug IN ('atlas-aeo', 'getservices-studio');
UPDATE businesses SET grp = 'Agencies & service providers', updated_at = datetime('now') WHERE slug = 'getservices-ai';
