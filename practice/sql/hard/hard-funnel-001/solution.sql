-- Xom Data · 4-step onboarding conversion rate
-- Problem: https://xomdata.com/practice/hard-funnel-001
-- Solved: 2026-09-08

WITH step_counts AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_name = 'signup' THEN user_id END) AS signup_users,
        COUNT(DISTINCT CASE WHEN event_name = 'verify_email' THEN user_id END) AS verify_email_users,
        COUNT(DISTINCT CASE WHEN event_name = 'first_login' THEN user_id END) AS first_login_users,
        COUNT(DISTINCT CASE WHEN event_name = 'first_purchase' THEN user_id END) AS first_purchase_users
    FROM events
)
SELECT step, n_users, COALESCE(ROUND(n_users::NUMERIC / NULLIF(signup_users, 0) * 100, 2),0) AS conversion_pct
FROM (
    SELECT 1 AS step_order, 'signup' AS step, signup_users AS n_users, signup_users FROM step_counts
    UNION ALL
    SELECT 2, 'verify_email', verify_email_users, signup_users FROM step_counts
    UNION ALL
    SELECT 3, 'first_login', first_login_users, signup_users FROM step_counts
    UNION ALL
    SELECT 4, 'first_purchase', first_purchase_users, signup_users FROM step_counts
) t
ORDER BY step_order;
