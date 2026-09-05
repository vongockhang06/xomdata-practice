-- Xom Data · Detect anomalous days vs the average
-- Problem: https://xomdata.com/practice/hard-anomaly-001
-- Solved: 2026-09-05

with cte as(
    select
        date,
        value,
        round(avg(value) over(),2) as mean,
        round(sqrt(avg(power((value) - (select avg(value) from daily_metrics),2)) over()),2) as stddev 
    from daily_metrics
)
,z_sc as(
    select
        *,
        case when stddev=0 then 0
        else round((value-mean)/stddev,2) end as z_score
    from cte
)
select
    *,
    case when z_score>2 then 'high'
    when z_score<-2 then 'low'
    else 'normal' end as flag
from z_sc
order by date
