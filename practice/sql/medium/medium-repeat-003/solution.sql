-- Xom Data · Kênh nào nuôi được khách quen
-- Problem: https://xomdata.com/practice/medium-repeat-003
-- Solved: 2026-09-02

with cte as(
    SELECT  
        channel,
        c.customer_id,
        count(*) as total_orders
    from orders o
    join customers c on o.customer_id=c.customer_id
    GROUP BY channel,c.customer_id 
)

    select
        channel,
        count(*) as total_customers,
        count(case when total_orders>=2 then 1 end) as repeat_customers,
        ROUND(count(case when total_orders>=2 then 1 end)::NUMERIC/count(*)*100,2) as repeat_rate_pct
    from cte
    GROUP BY channel 
    order by channel
