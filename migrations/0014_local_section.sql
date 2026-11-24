-- Local tab: Boston and Massachusetts news, shown in the nav between US and US Politics.
INSERT OR IGNORE INTO sections (slug, name, kind, parent_slug, sort_order, in_nav, commerce_allowed, always_human, description) VALUES
('local', 'Local', 'news', NULL, 15, 1, 1, 0, 'Boston and Massachusetts news');

-- The Thanksgiving travel story is about Logan Airport, so it moves from US to Local.
UPDATE stories SET section_slug = 'local' WHERE id = 'bd-20261120-tg-travel';
