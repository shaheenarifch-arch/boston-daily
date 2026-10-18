-- Opinion subsections: Editorials, Columns, Analysis. Commentary stays separated from news and commerce-free.
INSERT OR IGNORE INTO sections (slug, name, kind, parent_slug, sort_order, in_nav, commerce_allowed, always_human, description) VALUES
('editorials', 'Editorials', 'news', 'opinion', 121, 0, 0, 1, 'The view of the Boston Daily editorial board'),
('columns', 'Columns', 'news', 'opinion', 122, 0, 0, 1, 'Signed columns from named writers'),
('analysis', 'Analysis', 'news', 'opinion', 123, 0, 0, 1, 'Explanation and context from our journalists');
