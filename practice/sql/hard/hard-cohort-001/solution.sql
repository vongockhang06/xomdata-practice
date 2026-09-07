-- Xom Data · Retention rate by signup-month cohort
-- Problem: https://xomdata.com/practice/hard-cohort-001
-- Solved: 2026-09-07

with cte as(
    select
        user_id,
        substring(signup_date,1,7) as signup_month
    from signups
)
,cte1 as(
    select
        user_id,
        substring(active_date,1,7) as active_month
    from activity
)
select
signup_month,active_month,
count(DISTINCT c1.user_id) as n_active
from cte c join cte1 c1 on c.user_id=c1.user_id
where active_month>=signup_month
GROUP BY signup_month,active_month
ORDER BY signup_month,active_month
