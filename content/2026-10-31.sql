-- Newsroom drafts for 2026-10-31. Loaded once into EDITORIAL_REVIEW; an editor approves before anything is published.
-- Facts restated in Boston Daily's own words with attribution. Images are public domain with credit; stories without a unique rights-cleared image carry none.
-- Wikimedia Commons (API and file pages) was unreachable from the newsroom sandbox on this run, so only U.S. Navy / White House files were used, with URLs built from the file names. Editor: confirm each photo loads and matches its caption.
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-thompson-tro', 'judge-thompson-bars-doj-threats-prosecute-election-officials-noncitizen-demands', 'newsroom', 'news_story', 'courts', 'EDITORIAL_REVIEW', 0, 'Federal judge bars Justice Department from threatening election officials over noncitizen-voting demands', 'A temporary restraining order from U.S. District Judge Trina Thompson in San Francisco also blocks demands to purge voters or set aside ballots based on a federal list, days before Tuesday''s vote.', 'A federal judge in San Francisco on Friday temporarily blocked the Trump administration from threatening to prosecute state and local election officials who refuse its demands over alleged noncitizen voting, Reuters reported.

U.S. District Judge Trina Thompson issued a temporary restraining order in a lawsuit brought by election workers'' unions and other groups. Raw Story identified the plaintiffs as the unions SEIU and AFSCME and the civil rights organizations LULAC and the NAACP.

## What the order covers

According to Reuters and Raw Story, the order bars the Justice Department and the Department of Homeland Security from:

- threatening prosecution of officials who decline to comply or who count ballots as state and federal law require;
- demanding that officials remove voters from the rolls, refuse them ballots or reject their ballots based on the administration''s list of alleged noncitizens;
- demanding that ballots be segregated or left uncounted.

Thompson found the plaintiffs likely to succeed on a claim under Section 11(b) of the Voting Rights Act, Raw Story reported. Reuters said she cited an election only days away in finding that the public interest favored the plaintiffs.

The government must notify recipients of its letters that the demands are blocked and tell the court about any pending warrants, subpoenas or demands for election materials, according to Raw Story.

## Background

The plaintiffs said armed DHS officials delivered letters to California counties on Oct. 23 and that the Justice Department issued grand jury subpoenas, Raw Story reported. The administration has sought to have California hold back about 20,000 ballots. The Justice Department had no immediate comment, Reuters said.

## What comes next

| Date | Step |
| --- | --- |
| Nov. 2 | Government response due |
| Nov. 3 | Election Day |
| Nov. 13 | Court hearing |
| Nov. 16 | Order expires unless extended |', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-31.sql', 9, 1, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-thompson-tro-src1', 'bd-20261031-thompson-tro', 'Judge orders Trump administration to cease threats to prosecute election officials', 'https://www.yahoo.com/news/politics/articles/judge-orders-trump-administration-cease-025212837.html', 'Reuters (via Yahoo News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-thompson-tro-src2', 'bd-20261031-thompson-tro', 'Judge shuts down Trump DOJ''s prosecution threats against election workers counting ballots', 'https://www.rawstory.com/doj-california-election/', 'Raw Story', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-thompson-tro-ev1', 'bd-20261031-thompson-tro', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-trump-rallies-back', 'trump-reinstates-kansas-iowa-rallies-sunday-cedar-rapids-marshall-hinson', 'newsroom', 'news_story', 'white-house', 'EDITORIAL_REVIEW', 0, 'Trump puts Kansas and Iowa rallies back on the calendar for Sunday, a day after they were scrapped', 'The Iowa stop moves to Cedar Rapids. Both states hold Republican-held Senate seats that the parties are fighting over in the final weekend.', 'President Trump will hold in-person rallies in Kansas and Iowa on Sunday after all, reversing a decision announced a day earlier to replace them with telephone events, The Associated Press reported Friday.

The Republican National Committee had said Thursday that a Saturday rally in Salina, Kan., and a Sunday rally in Dubuque, Iowa, would not go ahead so Trump could reach more voters by phone. Both events are now set for Sunday, and the Iowa rally will be held in Cedar Rapids, according to the AP, which cited people familiar with the plans. The AP did not report which Kansas city will host the rally.

A source close to the administration told Al Jazeera the rallies were "BACK ON," and Al Jazeera reported that Republican officials had not ruled out adding another event before Tuesday.

## The races at stake

In Kansas, Sen. Roger Marshall faces Democrat Adam Hamilton, a Methodist pastor. An Emerson College poll released Friday showed Hamilton at 49% and Marshall at 45%, Al Jazeera reported. Al Jazeera noted that Kansas has not elected a Democrat to a full Senate term since 1932.

In Iowa, Rep. Ashley Hinson is the Republican Senate nominee. The AP noted that Trump campaigned in both states earlier this month.

## The back-and-forth

Asked Thursday whether his health or fatigue played a role in the cancellations, Trump said "I feel perfect," the AP reported. Democrats accused him of abandoning Republican candidates, according to Al Jazeera.

| Day | Trump schedule |
| --- | --- |
| Friday | Rally in Daytona Beach, Fla. |
| Sunday | Rallies in Kansas and Cedar Rapids, Iowa |
| Through Monday | Telerallies in other states |
| Tuesday, Nov. 3 | Election Day |', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/The_White_House_-_54443121411.jpg/1280px-The_White_House_-_54443121411.jpg', 'Official White House photo (file). Photo: The White House / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-31.sql', 8, 0, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-trump-rallies-back-src1', 'bd-20261031-trump-rallies-back', 'Trump will rally in Iowa and Kansas after initially canceling weekend trips before midterms', 'https://abc7ny.com/story/trump-will-rally-iowa-kansas-initially-canceling-weekend-trips-before-midterms/20000459/', 'The Associated Press (via ABC7 New York)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-trump-rallies-back-src2', 'bd-20261031-trump-rallies-back', 'Trump reverses course, reinstates cancelled campaign rallies', 'https://www.aljazeera.com/news/2026/10/30/trump-reverses-course-reinstates-cancelled-campaign-rallies', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-trump-rallies-back-ev1', 'bd-20261031-trump-rallies-back', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-new-england-senate', 'maine-new-hampshire-senate-races-final-polls-collins-jackson-pappas-sununu', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'Final polls show Democrats ahead in New England''s two Senate battlegrounds', 'Troy Jackson leads Sen. Susan Collins in Maine and Rep. Chris Pappas leads John E. Sununu in New Hampshire, though the Maine margin sits inside the error range.', 'Two of the Senate races that could decide control of the chamber are next door to Massachusetts, and the latest public polls in both show the Democrat in front heading into Tuesday.

## Maine: Collins vs. Jackson

A CNN poll conducted by SSRS from Oct. 20 to 25 found Democrat Troy Jackson at 49% and Republican Sen. Susan Collins at 45% among likely voters, the Portland Press Herald reported. The survey of 783 registered voters had a margin of error of 4.5 points, and results were nearly unchanged from a CNN poll taken in late summer.

An earlier Marist poll, taken Oct. 1 to 4, showed Jackson ahead 51% to 47% among registered voters.

In the governor''s race, the CNN poll had Democrat Hannah Pingree at 53% and Republican Bobby Charles at 39%, according to the Press Herald.

## New Hampshire: Pappas vs. Sununu

In New Hampshire, a UMass Lowell/YouGov poll of likely voters showed Democrat Chris Pappas at 48%, Republican John E. Sununu at 41% and Edmond LaPlante at 4%, Political Wire reported. The margin of error was 5 points.

A Saint Anselm College Survey Center poll also showed Pappas ahead, Boston 25 News reported. Neil Levesque of the New Hampshire Institute of Politics told the station that Pappas has led since spring and is winning independents.

## The latest numbers

| Race | Poll | Democrat | Republican |
| --- | --- | --- | --- |
| Maine | CNN/SSRS, Oct. 20-25 | Jackson 49% | Collins 45% |
| Maine | Marist, Oct. 1-4 | Jackson 51% | Collins 47% |
| New Hampshire | UMass Lowell/YouGov | Pappas 48% | Sununu 41% |

Polls open Tuesday, Nov. 3.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-31.sql', 7, 0, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-new-england-senate-src1', 'bd-20261031-new-england-senate', 'What the latest CNN poll revealed about Maine''s races before Election Day', 'https://www.pressherald.com/2026/10/29/what-the-latest-cnn-poll-found-about-maines-races-before-election-day/', 'Portland Press Herald', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-new-england-senate-src2', 'bd-20261031-new-england-senate', 'Midterm Elections in Maine, October 2026', 'https://maristpoll.marist.edu/polls/midterm-elections-in-maine-october-2026/', 'Marist Poll', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-new-england-senate-src3', 'bd-20261031-new-england-senate', 'Pappas Solidly Ahead in New Hampshire Senate Race', 'https://politicalwire.com/2026/10/29/pappas-solidly-ahead-in-new-hampshire-senate-race/', 'Political Wire', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-new-england-senate-src4', 'bd-20261031-new-england-senate', 'Pappas holds lead in New Hampshire senate race as candidates make final push before Election Day', 'https://www.yahoo.com/news/politics/articles/pappas-holds-lead-hampshire-senate-021224885.html', 'Boston 25 News (via Yahoo News)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-new-england-senate-ev1', 'bd-20261031-new-england-senate', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-early-vote-43m', 'early-vote-tops-43-million-ahead-of-2022-pace-texas-georgia-maine', 'newsroom', 'news_story', 'elections', 'EDITORIAL_REVIEW', 0, 'More than 43 million Americans have already voted, millions ahead of the 2022 pace', 'Early turnout jumped more than 30% in Maine, Michigan, North Carolina and Kansas, according to an Associated Press analysis, though it says nothing about who is winning.', 'Early voting in the midterm elections has run well ahead of 2022, with more than 43 million ballots cast in person or by mail five days before Election Day, according to an Associated Press analysis cited by Al Jazeera.

That is nearly 10 million more than at the same point four years ago. CBS News, citing the University of Florida Election Lab, put the total above 44 million as of Thursday afternoon.

## Where turnout is up

The AP analysis found early voting up more than 30% over 2022 in Maine, Michigan, North Carolina and Kansas, Al Jazeera reported. Several of those states have competitive Senate races.

| State | Early votes this year | Same point in 2022 |
| --- | --- | --- |
| Texas | More than 6.3 million (as of Wednesday) | 4.2 million |
| Georgia | More than 2.5 million (by Friday morning) | 2.3 million in all of early voting |

In Minneapolis, officials accepted 52,661 early and absentee ballots, a record for a year without a presidential race, CBS News reported. The previous mark was 52,313 in 2018.

## What it does and does not mean

Early turnout shows how many people have voted, not how they voted or who will win, Al Jazeera noted.

Al Jazeera reported that Democrats lead the RealClearPolling average of the national congressional ballot, 51.4% to 43.2%. CBS News reported that Republicans hold 53 Senate seats to Democrats'' 47.

Polls open Tuesday, Nov. 3. Voters can check hours and locations with their state or local election office.', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-31.sql', 7, 0, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-early-vote-43m-src1', 'bd-20261031-early-vote-43m', 'US midterms: 3 days to go - what latest polls say as early voting surges', 'https://www.aljazeera.com/news/2026/10/31/us-midterms-3-days-to-go-what-latest-polls-say-as-early-voting-surges', 'Al Jazeera', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-early-vote-43m-src2', 'bd-20261031-early-vote-43m', '2026 elections live updates', 'https://www.cbsnews.com/live-updates/2026-elections-midtems-house-senate-trump/', 'CBS News', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-early-vote-43m-ev1', 'bd-20261031-early-vote-43m', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-celtics-bulls', 'pritchard-30-celtics-beat-bulls-125-111-nba-cup-opener-fourth-straight', 'newsroom', 'news_story', 'nba', 'EDITORIAL_REVIEW', 0, 'Pritchard scores 30 as Celtics roll past Bulls 125-111 in NBA Cup opener', 'Boston led by 32 in the first half for its fourth straight win and heads to Orlando on Sunday.', 'Payton Pritchard scored 30 points off the bench and the Celtics beat the Chicago Bulls 125-111 on Friday night at TD Garden in the opener of NBA Cup group play for both teams, according to The Associated Press.

Boston has won four in a row since a season-opening loss at Detroit and improved to 4-1, all four wins at home. Chicago fell to 1-5 with its fourth straight loss, the AP reported. It was the second meeting in five days: Boston won 134-99 on Monday.

## How it happened

The Celtics broke the game open in the first quarter, turning a 9-6 deficit into a 35-18 lead with a 29-9 run and taking a 44-25 lead after one, according to The Ticket''s game story. Boston led by as many as 32 and went to halftime ahead 78-49, with Pritchard scoring 20 in the first half.

Chicago won the second half but never got closer than 14, MassLive reported.

## Box score highlights

| Player | Team | Points | Notes |
| --- | --- | --- | --- |
| Payton Pritchard | BOS | 30 | 9 of 17 shooting |
| Jayson Tatum | BOS | 26 | 7 rebounds, 7 assists |
| Paul George | BOS | 18 | 8 assists |
| Caleb Wilson | CHI | 23 | Six 3-pointers |
| Norman Powell | CHI | 16 | |
| Matas Buzelis | CHI | 14 | |

Boston scored 56 points in the paint and turned 16 Chicago turnovers into 21 points, the AP reported. The Bulls shot 38% from the floor and made 15 of 50 3-point tries.

## Up next

| Team | Next game |
| --- | --- |
| Celtics | Sunday at Orlando, 3:30 p.m. |
| Bulls | Monday at Philadelphia |', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-31.sql', 7, 0, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-celtics-bulls-src1', 'bd-20261031-celtics-bulls', 'Celtics 125-111 Bulls (Oct 30, 2026) Game Recap', 'https://www.espn.com/nba/recap?gameId=401909278', 'The Associated Press (via ESPN)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-celtics-bulls-src2', 'bd-20261031-celtics-bulls', '4 takeaways as Celtics beat Bulls in NBA Cup opener', 'https://sports.yahoo.com/articles/4-takeaways-celtics-beat-bulls-021021394.html', 'MassLive (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-celtics-bulls-src3', 'bd-20261031-celtics-bulls', 'Celtics win 4th straight, roll past Bulls in NBA Cup opener', 'https://www.theticket.com/2026/10/30/celtics-win-4th-straight-roll-past-bulls-in-nba-cup-opener/', 'The Ticket (KTCK)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-celtics-bulls-ev1', 'bd-20261031-celtics-bulls', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-bruins-blackhawks', 'bruins-host-blackhawks-halloween-matinee-td-garden-after-two-losses', 'newsroom', 'news_story', 'nhl', 'EDITORIAL_REVIEW', 0, 'Bruins look to snap a two-game skid in a Halloween matinee against the Blackhawks', 'Boston has scored two goals in its last two games. Chicago arrives 1-4 in its last five.', 'The Bruins return to TD Garden for a 1 p.m. game against the Chicago Blackhawks on Saturday, trying to shake off a two-game road trip in which they scored twice.

Boston lost 2-1 at Carolina on Tuesday and 4-1 at St. Louis on Thursday, according to a preview from Fox Sports 1070. The game airs on NESN, NESN reported.

## Where things stand

The Bruins entered the day 9-4-1 and second in the Eastern Conference, while the Blackhawks were 4-9, according to Fox Sports 1070. NESN reported that Chicago has gone 1-4 in its last five games, most recently losing to Detroit on Thursday.

| Recent results | Bruins | Blackhawks |
| --- | --- | --- |
| Oct. 24-25 | W 6-4 vs. San Jose | L 3-2 vs. Florida |
| Oct. 27 | L 2-1 at Carolina | W 2-1 vs. Los Angeles |
| Oct. 29 | L 4-1 at St. Louis | L 4-1 at Detroit |

## Players to watch

David Pastrnak leads Boston with 18 points in 14 games, and Jeremy Swayman is 7-3-1 with a 2.40 goals-against average and a .912 save percentage, according to Fox Sports 1070. NESN noted that rookie James Hagens has four points, three of them goals, in his last five games.

For Chicago, Connor Bedard has three goals and four assists, and Spencer Knight is 4-7-0 in goal, Fox Sports 1070 reported. Defenseman Ryan Ellis is out for the season.

| Game info | |
| --- | --- |
| Time | 1 p.m. Saturday |
| Place | TD Garden |
| TV | NESN |', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-31.sql', 6, 0, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-bruins-blackhawks-src1', 'bd-20261031-bruins-blackhawks', 'How to Watch Bruins vs. Blackhawks Today: Channel, Live Stream & Start Time', 'https://sports.yahoo.com/articles/watch-bruins-vs-blackhawks-today-050001059.html', 'NESN (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-bruins-blackhawks-src2', 'bd-20261031-bruins-blackhawks', 'Blackhawks vs. Bruins Time, TV & Live Stream', 'https://foxsports1070.iheart.com/content/2026-10-30-blackhawks-vs-bruins-time-tv-live-stream-10312026/', 'Fox Sports 1070 (iHeartMedia)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-bruins-blackhawks-ev1', 'bd-20261031-bruins-blackhawks', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-patriots-dolphins', 'patriots-dolphins-preview-aj-brown-henderson-questionable-miami', 'newsroom', 'news_story', 'nfl', 'EDITORIAL_REVIEW', 0, 'A.J. Brown and TreVeyon Henderson questionable as 4-3 Patriots visit 1-5 Dolphins', 'Neither practiced Friday. New England is 3-0 in the AFC East and has won the last two meetings with Miami.', 'The Patriots list wide receiver A.J. Brown and running back TreVeyon Henderson as questionable for Sunday''s game at Miami, according to the team''s final injury report. Neither practiced Friday: Brown is dealing with ankle and knee injuries, Henderson with an illness.

Coach Mike Vrabel said a decision on Brown would come after the team saw him Saturday. "We will see when he comes in tomorrow," Vrabel said, according to Patriots Wire. The site reported that Kyle Williams, DeMario Douglas and Efton Chism III would be the top receivers if Brown sits.

Cornerback Carlton Davis III and linebacker Christian Elliss are also questionable after full practices. Quarterback Drake Maye, listed with a right shoulder issue, practiced fully and has no game designation. For Miami, guard-tackle Kadyn Proctor is out with a concussion.

## The matchup

New England is 4-3 and 3-0 in the division. Miami is 1-5. The Patriots swept the Dolphins last season, but are 18-43 all-time in Miami, according to Patriots.com.

| 2026 per game | Patriots | Dolphins |
| --- | --- | --- |
| Points scored | 22.8 | 16.3 |
| Points allowed | 20.4 | 26.2 |
| Total yards | 375.0 | 293.5 |
| Passing yards | 253.0 | 162.0 |

Maye threw for 321 yards last week at Chicago, and a second straight 300-yard game would be the first by a Patriots quarterback since Tom Brady in 2019, the team noted. Rhamondre Stevenson needs 46 rushing yards to reach 4,000 for his career.

| Game info | |
| --- | --- |
| When | Sunday, Nov. 1, late afternoon |
| Where | Hard Rock Stadium, Miami Gardens, Fla. |
| TV | CBS (WBZ-TV Channel 4 in Boston) |
| Radio | 98.5 The Sports Hub |', 'Boston Daily Staff', NULL, NULL, NULL, 'newsroom', 'content/2026-10-31.sql', 7, 0, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-patriots-dolphins-src1', 'bd-20261031-patriots-dolphins', 'Week 8 Injury Report: Patriots at Dolphins', 'https://www.patriots.com/news/week-8-injury-report-patriots-at-dolphins-x9227', 'New England Patriots (Patriots.com)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-patriots-dolphins-src2', 'bd-20261031-patriots-dolphins', 'Game Preview: Patriots at Dolphins, NFL Week 8', 'https://www.patriots.com/news/game-preview-patriots-at-dolphins-nfl-week-8', 'New England Patriots (Patriots.com)', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-patriots-dolphins-src3', 'bd-20261031-patriots-dolphins', 'Mike Vrabel reveals game statuses for A.J. Brown, TreVeyon Henderson', 'https://sports.yahoo.com/articles/mike-vrabel-reveals-game-statuses-173245191.html', 'Patriots Wire (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-patriots-dolphins-ev1', 'bd-20261031-patriots-dolphins', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO stories (id, slug, lane, type, section_slug, status, sensitive, headline, dek, body, byline, hero_image_url, hero_image_credit, hero_image_rights, source_system, source_ref, priority, is_lead_candidate, created_by, created_at, updated_at) VALUES ('bd-20261031-notre-dame-navy', 'notre-dame-navy-gillette-stadium-foxborough-first-new-england-meeting', 'newsroom', 'news_story', 'college-football', 'EDITORIAL_REVIEW', 0, 'Notre Dame and Navy bring one of college football''s oldest rivalries to Foxborough', 'The 99th meeting is the first in New England and Notre Dame''s first game at Gillette Stadium. Kickoff is noon on ABC.', 'Notre Dame and Navy meet for the 99th time Saturday, and for the first time in New England, when the Midshipmen host the Fighting Irish at Gillette Stadium.

Kickoff is noon on ABC, according to the South Bend Tribune. It is Notre Dame''s first game at Gillette and Navy''s second, after the 2023 Army-Navy Game, according to the stadium. Navy is the designated home team.

## A long series

The programs first played in 1927 and met every year from 1927 through 2019 before the 2020 game was canceled because of COVID-19, according to Gillette Stadium. Notre Dame leads the series 84-13-1 and won last year''s game 49-10 at Notre Dame Stadium, the Tribune reported.

| Series facts | |
| --- | --- |
| Meeting | 99th |
| All-time | Notre Dame leads 84-13-1 |
| 2025 result | Notre Dame 49, Navy 10 |
| Betting line | Notre Dame favored by about 30, per the Tribune |

## What to watch

Navy is 2-5, according to UHND.com, a Notre Dame fan site. Quarterback Jackson Gutierrez runs the triple-option offense and has 869 rushing yards and 12 rushing touchdowns, the site reported. The Tribune reported that Notre Dame expects an extended absence for cornerback DJ McKinney.

## Getting there

Parking opens at 8 a.m. and gates at 10 a.m., with access to the stadium only by Route 1, according to Gillette Stadium. An MBTA special event train runs from South Station, with stops at Back Bay and Dedham Corporate Center, for $20 round trip. Regular commuter rail tickets are not valid, and the stadium is cashless.', 'Boston Daily Staff', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flickr_-_Official_U.S._Navy_Imagery_-_A_Notre_Dame_player_breaks_a_tackle..jpg/1280px-Flickr_-_Official_U.S._Navy_Imagery_-_A_Notre_Dame_player_breaks_a_tackle..jpg', 'A Notre Dame player breaks a tackle in an earlier Navy-Notre Dame game (file). Photo: U.S. Navy / Wikimedia Commons, public domain', 'public_domain', 'newsroom', 'content/2026-10-31.sql', 6, 0, 'newsroom-assistant', '2026-10-31T10:30:00.000Z', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-notre-dame-navy-src1', 'bd-20261031-notre-dame-navy', '2026 Navy-Notre Dame Game', 'https://www.gillettestadium.com/events/2026-navy-notre-dame-game/', 'Gillette Stadium', 'web', 'PRIMARY_SOURCE', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-notre-dame-navy-src2', 'bd-20261031-notre-dame-navy', 'Notre Dame football vs Navy live updates, score, highlights from Foxborough', 'https://sports.yahoo.com/articles/notre-dame-football-vs-navy-080101412.html', 'South Bend Tribune (via Yahoo Sports)', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_sources (id, story_id, title, url, publisher, channel, rights_type, verified, public, retrieved_at, notes, added_by, created_at) VALUES ('bd-20261031-notre-dame-navy-src3', 'bd-20261031-notre-dame-navy', 'Notre Dame Football Primer: #5 Fighting Irish Ship Up to Foxborough to face Navy', 'https://www.uhnd.com/football/2026/10/28/notre-dame-football-primer-5-fighting-irish-ship-up-to-foxborough-to-face-navy/', 'UHND.com', 'web', 'ATTRIBUTED_REPORT', 1, 1, '2026-10-31T10:30:00.000Z', 'Opened and checked by the newsroom assistant on 2026-10-31. Editor to confirm.', 'newsroom-assistant', '2026-10-31T10:30:00.000Z');
INSERT OR IGNORE INTO story_events (id, story_id, from_status, to_status, actor, note, created_at) VALUES ('bd-20261031-notre-dame-navy-ev1', 'bd-20261031-notre-dame-navy', NULL, 'EDITORIAL_REVIEW', 'newsroom-assistant', 'Drafted from attributed reporting and primary sources; awaiting editor approval', '2026-10-31T10:30:00.000Z');
