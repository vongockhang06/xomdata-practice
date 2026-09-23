-- Xom Data · Nhịp rời mạng của thuê bao theo tháng
-- Problem: https://xomdata.com/practice/hard-churn-004
-- Solved: 2026-09-23

with find_ended_subs as(
    select
        substring(end_date,1,7) as month,
        count(*) as ended_subs
    from subscriptions
    GROUP BY substring(end_date,1,7)
)
, cte as(
    select
        month,
        count(case when s.start_date IS NOT NULL then 1 end)as active_at_start
    from find_ended_subs f left join subscriptions s 
    on s.start_date<month||'-01' and (s.end_date>=month||'-01' OR s.end_date IS NULL)
    where month IS NOT NULL
    GROUP BY month
)
select
    c.*,
    f.ended_subs,
    case when active_at_start=0 then null else 
    round(ended_subs*100.0/active_at_start,2) end as churn_rate_pct
from cte c join find_ended_subs f on c.month=f.month
