-- Editor-approved update to the US AI laws explainer (Nov. 19, 2026), done the same way as an Update in the console:
-- new text, version + 1, a public update note, a version snapshot and an event. Status becomes UPDATED (a CORRECTED story stays CORRECTED).
-- Fact changes only, each from a source added below:
--  1) Full list of AI accord signers (adds Anthropic's Dario Amodei; xAI is now part of SpaceX). Source: AP via NBC New York.
--  2) SB 1119 signing date (Sept. 10, 2026) and start date (July 1, 2027). Source: Akin Gump.
--  3) Replaces the weak "AP coverage in late September..." line with the status of the bipartisan Great American AI Act draft. Source: Broadband Breakfast.
-- Links to network businesses are NOT added to the story text: they appear in the labeled "From our network" module, per our standards.
-- Every statement is guarded to the live story, so nothing happens if the story is not public.

UPDATE stories SET
  body = REPLACE(REPLACE(REPLACE(REPLACE(body,
    'AP coverage in late September described California officials criticizing the absence of comprehensive federal AI regulation, a sign Congress had not yet acted on the framework.',
    'The framework is a set of recommendations, not a law. The most prominent bill in Congress so far is a bipartisan discussion draft, the Great American AI Act of 2026, released in June by Reps. Jay Obernolte (R-Calif.) and Lori Trahan (D-Mass.). It would freeze state laws that specifically regulate AI model development for three years, while leaving states free to regulate how AI is used, according to Broadband Breakfast.'),
    'The AP said signers included executives from Google, Meta, OpenAI and Nvidia, along with Elon Musk of xAI.',
    'The AP said signers included Anthropic CEO Dario Amodei, Google CEO Sundar Pichai, Meta CEO Mark Zuckerberg, OpenAI President Greg Brockman and Nvidia CEO Jensen Huang, along with Elon Musk as founder of xAI, which is now part of SpaceX.'),
    '| Companion chatbot child safety law (SB 1119) | Signed September 2026 |',
    '| Companion chatbot child safety law (SB 1119) | Signed Sept. 10, 2026; main rules start July 1, 2027 |'),
    'alerts when a child disables safety settings, and independent child safety audits.',
    'alerts when a child disables safety settings, and independent child safety audits. Newsom signed it on Sept. 10, 2026, and its main requirements take effect July 1, 2027, according to the law firm Akin Gump.'),
  version = version + 1,
  last_updated_at = '2026-11-20T03:10:00.000Z',
  status = CASE WHEN status = 'CORRECTED' THEN 'CORRECTED' ELSE 'UPDATED' END,
  updated_at = '2026-11-20T03:10:00.000Z'
WHERE id = 'bd-20261018-us-ai-rules' AND status IN ('PUBLISHED','UPDATED','CORRECTED')
  AND instr(body, 'AP coverage in late September described California officials') > 0;

INSERT OR IGNORE INTO story_versions (id, story_id, version, change_type, headline, dek, body, note, editor, created_at)
  SELECT 'bd-20261018-us-ai-rules-v-20261119', id, version, 'update', headline, dek, body,
    'Updated to add the full list of AI accord signers, the signing and start dates for California''s SB 1119, and the status of the bipartisan Great American AI Act draft in Congress.',
    'Shaheen Arif', '2026-11-20T03:10:00.000Z'
  FROM stories WHERE id = 'bd-20261018-us-ai-rules' AND last_updated_at = '2026-11-20T03:10:00.000Z';

INSERT OR IGNORE INTO story_notices (id, story_id, kind, note, editor, created_at)
  SELECT 'bd-20261018-us-ai-rules-n-20261119', id, 'update',
    'Updated to add the full list of AI accord signers, the signing and start dates for California''s SB 1119, and the status of the bipartisan Great American AI Act draft in Congress.',
    'Shaheen Arif', '2026-11-20T03:10:00.000Z'
  FROM stories WHERE id = 'bd-20261018-us-ai-rules' AND last_updated_at = '2026-11-20T03:10:00.000Z';

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT 'bd-20261018-us-ai-rules-ev-20261119', id, 'PUBLISHED', status, 'Shaheen Arif', 'Update approved by the editor: accord signers, SB 1119 dates, Congress status', '2026-11-20T03:10:00.000Z'
  FROM stories WHERE id = 'bd-20261018-us-ai-rules' AND last_updated_at = '2026-11-20T03:10:00.000Z';

INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at)
  SELECT 'bd-20261018-us-ai-rules-src11', id, 'Trump says top tech firms have signed accord to ''self-police'' AI development', 'https://www.nbcnewyork.com/news/tech/trump-top-tech-firms-sign-accord-self-police-ai-development/6553701/', 'Associated Press (via NBC New York)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T03:10:00.000Z', 'Signer list checked on 2026-11-19.', 'newsroom-assistant', '2026-11-20T03:10:00.000Z'
  FROM stories WHERE id = 'bd-20261018-us-ai-rules' AND last_updated_at = '2026-11-20T03:10:00.000Z';
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at)
  SELECT 'bd-20261018-us-ai-rules-src12', id, 'California Enacts Companion Chatbot Child Safety Requirements, SB 1119', 'https://www.akingump.com/en/insights/ai-law-and-regulation-tracker/california-enacts-companion-chatbot-child-safety-requirements-sb-1119', 'Akin Gump', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T03:10:00.000Z', 'Signing date and July 1, 2027 operative date checked on 2026-11-19.', 'newsroom-assistant', '2026-11-20T03:10:00.000Z'
  FROM stories WHERE id = 'bd-20261018-us-ai-rules' AND last_updated_at = '2026-11-20T03:10:00.000Z';
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at)
  SELECT 'bd-20261018-us-ai-rules-src13', id, 'AI Preemption Battle Lands in Congress With Substantive Discussion Draft', 'https://www.broadbandbreakfast.com/ai-preemption-battle-lands-in-congress-with-substantive-discussion-draft/', 'Broadband Breakfast', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-20T03:10:00.000Z', 'Great American AI Act discussion draft details checked on 2026-11-19.', 'newsroom-assistant', '2026-11-20T03:10:00.000Z'
  FROM stories WHERE id = 'bd-20261018-us-ai-rules' AND last_updated_at = '2026-11-20T03:10:00.000Z';
