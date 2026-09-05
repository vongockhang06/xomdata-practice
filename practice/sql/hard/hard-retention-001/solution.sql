-- Xom Data · D7 and D30 retention rate
-- Problem: https://xomdata.com/practice/hard-retention-001
-- Solved: 2026-09-05

with cte as(
    select
        s.user_id,
        COALESCE(sum(case when julianday(active_date) between  julianday(signup_date)+1 and julianday(signup_date)+7 then 1 else 0 end),0) as d7,
        COALESCE(sum(case when julianday(active_date) between  julianday(signup_date)+1 and julianday(signup_date)+30 then 1 else 0 end),0) as d30
    from signups s left join activity a on s.user_id=a.user_id
    GROUP BY s.user_id
)
, cte2 as(
    select
        count(*) as total_users,
        count(case when d7>0 then 1 end) as d7_retained,
        count(case when d30>0 then 1 end) as d30_retained
    from cte
)
select
    total_users,
    d7_retained,
    case when total_users=0 then 0.0 else 
    ROUND(d7_retained*1.0/total_users*100,2) end  as d7_rate,
    d30_retained,
    case when total_users=0 then 0.0 else 
    ROUND(d30_retained*1.0/total_users*100,2) end as d30_rate
from cte2
