-- Xom Data · Giữ được bao nhiêu phần doanh thu thuê bao
-- Problem: https://xomdata.com/practice/hard-retention-008
-- Solved: 2026-09-23

with find_month as(
    select
        substring(start_date,1,7) as month
    from subscriptions 
    union 
    select
        substring(end_date,1,7) as month
    from subscriptions 
    where end_date IS NOT NULL
)
, cte as(
    select
        month,
        sum(monthly_fee) as mrr
    from find_month f join subscriptions s
    on substring(s.start_date,1,7)<=month and (s.end_date IS NULL or substring(s.end_date,1,7)>=month)
    GROUP BY month
)
, cte2 as(
    select
        month,
        mrr,
        lag(month) over(ORDER BY month) as prev_month,
        lag(mrr) over(ORDER BY month) as prev_mrr,
        substring(date(month||'-01','-1 months'),1,7) as expect_prev_month
    from cte 
)
select
    month,
    mrr,
    prev_mrr,
    round(mrr*100.0/prev_mrr,2) as retention_pct
from cte2 
where expect_prev_month=prev_month
ORDER BY month
