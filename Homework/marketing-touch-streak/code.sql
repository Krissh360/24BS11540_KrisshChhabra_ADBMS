WITH weekly_touches AS (
    SELECT DISTINCT
        contact_id,
        DATE_TRUNC('week', event_date)::date AS touch_week
    FROM marketing_touches
),

numbered_weeks AS (
    SELECT
        contact_id,
        touch_week,
        touch_week
          - (ROW_NUMBER() OVER (
                PARTITION BY contact_id
                ORDER BY touch_week
            )::int * 7) AS streak_group
    FROM weekly_touches
),

streak_contacts AS (
    SELECT contact_id
    FROM numbered_weeks
    GROUP BY contact_id, streak_group
    HAVING COUNT(*) >= 3
),

trial_contacts AS (
    SELECT DISTINCT contact_id
    FROM marketing_touches
    WHERE event_type = 'trial_request'
)

SELECT DISTINCT c.email
FROM crm_contacts c
JOIN streak_contacts s
    ON c.contact_id = s.contact_id
JOIN trial_contacts t
    ON c.contact_id = t.contact_id;