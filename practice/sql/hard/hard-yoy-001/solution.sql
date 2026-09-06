-- Xom Data · YoY and QoQ sales growth
-- Problem: https://xomdata.com/practice/hard-yoy-001
-- Solved: 2026-09-06

with cte as(
    select
        year,
        quarter,
        revenue,
        lag(revenue) over(order by year, quarter) as prev_quarter_revenue,
        lag(revenue,4) over(order by year, quarter) as prev_year_revenue
    from quarterly_sales
)
select
    *,
    case when prev_quarter_revenue=0 or prev_quarter_revenue is null then NULL
    else round((revenue-prev_quarter_revenue)::numeric/prev_quarter_revenue*100,2) end as qoq_pct,
    case when prev_quarter_revenue=0 or prev_quarter_revenue is null then NULL
    else round((revenue-prev_year_revenue)::numeric/prev_year_revenue*100,2) end as yoy_pct
from cte 
order by year,quarter
