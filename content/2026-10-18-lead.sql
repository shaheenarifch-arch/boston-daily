-- Editor request (Oct. 18, 2026): lead the front page with the Patriots-Jets gameday story.
-- Still needs an editor to approve and publish it; this only sets its front-page placement.
UPDATE stories SET is_lead_candidate = 1, priority = 9 WHERE id = 'bd-20261018-patriots-jets';
UPDATE stories SET is_lead_candidate = 0 WHERE id = 'bd-20261018-press-secretary';
