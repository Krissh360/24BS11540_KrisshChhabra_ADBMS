SELECT
ROUND
(count (DISTINCT e.email_id) FILTER
(WHERE t.signup_action = 'Confirmed') :: DECIMAL
/ count(DISTINCT e.email_id), 2)
AS activation_rate
FROM emails e
left join texts t
ON e.email_id = t.email_id;