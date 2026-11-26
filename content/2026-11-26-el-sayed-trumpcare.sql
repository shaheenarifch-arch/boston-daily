-- Revised draft of the Nov. 26 Trump / El-Sayed story (bd-20261126-trump-el-sayed-medicare-for-all-meeting), at the editor's request.
-- Why: the 2026-11-26 package drafted it from one report (Al Jazeera), which the approval rule blocks
-- ("Attributed reporting needs two verified reports from different publishers"). This package:
--   1) adds two more verified reports (CNN, NBC News), so the story can be approved;
--   2) rewrites the text from all three reports, adding Trump's own words and El-Sayed's response;
--   3) replaces the Hart Senate Office Building file photo with a real photo of El-Sayed, new to the site
--      (Conlan Houston, Wikimedia Commons, CC BY-SA 4.0; license confirmed on the file page on 2026-11-26).
-- Nothing here publishes the story. It stays in EDITORIAL_REVIEW until the editor approves it in /admin.
-- Every change is guarded to the draft, so a story that was already approved or published is not touched.
-- A draft that was rejected goes back to review (REJECTED -> DRAFTING -> EDITORIAL_REVIEW, both steps logged).

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT id || '-ev-reopen-20261126', id, 'REJECTED', 'DRAFTING', 'newsroom-assistant', 'Reopened at editor request to revise and resubmit', '2026-11-26T17:30:00.000Z'
  FROM stories WHERE id = 'bd-20261126-trump-el-sayed-medicare-for-all-meeting' AND status = 'REJECTED';

INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at)
  SELECT id || '-ev-revise-20261126', id, CASE WHEN status = 'REJECTED' THEN 'DRAFTING' ELSE status END, 'EDITORIAL_REVIEW', 'newsroom-assistant',
    'Revised at editor request: added CNN and NBC News reports, Trump''s quotes and El-Sayed''s response; new photo of El-Sayed (CC BY-SA 4.0). Awaiting editor approval', '2026-11-26T17:30:01.000Z'
  FROM stories WHERE id = 'bd-20261126-trump-el-sayed-medicare-for-all-meeting' AND status IN ('EDITORIAL_REVIEW', 'DRAFTING', 'REJECTED');

UPDATE stories SET
  headline = 'Trump says he will meet Michigan Senator-elect Abdul El-Sayed over his "Trumpcare" pitch for universal health care',
  dek = 'El-Sayed has offered to put Trump''s name on a single public health plan. Trump called him "a smart guy" in a New York Post interview, but no meeting date is set and he has not backed the plan.',
  body = 'President Donald Trump says he will meet Abdul El-Sayed, the Democratic senator-elect from Michigan, after El-Sayed offered to call a single, government-run health plan "Trumpcare."

"I know I''ll be meeting with him," Trump said in a 45-minute Oval Office interview with the New York Post on Tuesday, Nov. 24, according to CNN and Al Jazeera. "Maybe there''s some place in the middle that we could go." Of El-Sayed, he said, "He''s a smart guy," adding, "He actually did a very good job." The Post reported that Trump called the renaming idea "very smart," CNN said. No date or place for a meeting has been announced.

## How the pitch began

El-Sayed, a physician and former head of Detroit''s health department, made Medicare for All the center of his Senate campaign. On Nov. 12 he posted on X a mock-up of a gold "TrumpCare" insurance card bearing the president''s signature, with the words "Donald, this is on the table," Al Jazeera reported.

Trump reshared the post on Truth Social on Saturday, Nov. 21, without comment, NBC News reported. In a statement that afternoon, El-Sayed said he was "happy to chat" if the president''s intentions were genuine, NBC said. On NBC''s "Meet the Press" the next day, he called the plan "the ultimate Trump card," according to Al Jazeera, and he has said the name matters less to him than guaranteed coverage.

Earlier in November, on ABC''s "This Week," El-Sayed said he would be glad to meet Trump if it could advance the goals he ran on, including getting money out of politics and passing Medicare for All, CNN reported. Vice President JD Vance''s office has contacted El-Sayed''s team about setting up a meeting, NBC News reported, according to Al Jazeera.

## From campaign attacks to praise

The praise is a sharp turn. At an Oct. 25 rally in Port Huron, Mich., Trump said he was there "to keep a jihadist Muslim Brotherhood member from becoming a United States senator," Al Jazeera reported. There is no evidence of any such tie, and El-Sayed has denied one. Democrats said the attacks targeted his Muslim faith and Egyptian heritage.

El-Sayed defeated Republican Mike Rogers on Nov. 3 and will be the first Muslim member of the U.S. Senate when he takes office in January.

## Reasons for doubt

Trump has not endorsed a single-payer system. As recently as August he said Medicare for All "doesn''t work," and a White House spokesperson earlier dismissed El-Sayed''s idea as "Medicare for none," Al Jazeera reported. Democrats take control of Congress in January, and in the Post interview Trump said, "I''m just going to veto everything there is, and then at some point, I think they''re going to want to negotiate."

Democrats will hold a 56-44 Senate majority, counting two independents who caucus with them, and 258 House seats. That is short of the two-thirds of both chambers needed to override a veto, Al Jazeera reported.

Ian Lesser of the Policy Center for the New South told Al Jazeera he did not expect anything like the single-payer system El-Sayed favors, but said Trump "could be inclined toward some new health reforms if he can put his own stamp on them." Scott Lucas of University College Dublin''s Clinton Institute was more doubtful, saying Trump "wants the good photo ops" and calling the gesture "a show."',
  hero_image_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Abdul_El-Sayed_meet-and-greet_by_Conlan_Houston_5.jpg/1280px-Abdul_El-Sayed_meet-and-greet_by_Conlan_Houston_5.jpg',
  hero_image_credit = 'Abdul El-Sayed meets voters at Michigan Technological University during his Senate campaign on Oct. 22, 2025 (file photo). Photo: Conlan Houston / Wikimedia Commons, CC BY-SA 4.0',
  hero_image_rights = 'licensed',
  image_checked_at = NULL,
  status = 'EDITORIAL_REVIEW',
  updated_at = '2026-11-26T17:30:01.000Z'
WHERE id = 'bd-20261126-trump-el-sayed-medicare-for-all-meeting' AND status IN ('EDITORIAL_REVIEW', 'DRAFTING', 'REJECTED');

INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261126-trump-el-sayed-medicare-for-all-meeting-src2', 'bd-20261126-trump-el-sayed-medicare-for-all-meeting', 'Trump calls El-Sayed ''smart guy'' and says he''ll meet with him about ''Trumpcare''', 'https://www.kcra.com/article/trump-el-sayed-trumpcare-meeting/74534580', 'CNN (via KCRA)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-26T17:20:00.000Z', 'CNN report republished by KCRA, Nov. 25, 2026. Opened and checked by the newsroom assistant on 2026-11-26: Trump''s New York Post quotes, Vance outreach, El-Sayed on ABC''s This Week.', 'newsroom-assistant', '2026-11-26T17:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261126-trump-el-sayed-medicare-for-all-meeting-src3', 'bd-20261126-trump-el-sayed-medicare-for-all-meeting', 'Abdul El-Sayed catches Trump''s attention with pitch for ''Trumpcare''', 'https://www.yahoo.com/news/politics/articles/abdul-el-sayed-catches-trump-003721633.html', 'NBC News (via Yahoo News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-11-26T17:20:00.000Z', 'NBC News report by Kyla Guilfoil, republished by Yahoo News, Nov. 21, 2026 (ET). Opened and checked by the newsroom assistant on 2026-11-26: Truth Social reshare, El-Sayed''s "happy to chat" statement.', 'newsroom-assistant', '2026-11-26T17:30:00.000Z');
