-- Rename the Opinion section to the 1st Amendment Page (slug stays 'opinion' so existing links and search rankings keep working).
UPDATE sections SET name = '1st Amendment Page', description = 'Freedom of speech: guest writers on any topic, from any viewpoint' WHERE slug = 'opinion';
