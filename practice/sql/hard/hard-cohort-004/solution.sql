-- Xom Data · Thế hệ khách nhìn theo kênh dẫn về
-- Problem: https://xomdata.com/practice/hard-cohort-004
-- Solved: 2026-09-23

with cte as(
    select
        c.customer_id,
        channel,
        substring(order_date,1,7) as month,
        substring(min(order_date) over(PARTITION BY c.customer_id) ,1,7) as cohort_month,
        substring(date(order_date,'+1 months'),1,7) as expected_next_month,
        substring(lead(order_date) over(PARTITION BY c.customer_id),1,7) as actual_next_month
    from orders o join customers c on o.customer_id=c.customer_id
)
, cte2 as(
    select
        channel,
        cohort_month,
        count(DISTINCT customer_id) as cohort_size,
        count(DISTINCT case when expected_next_month=actual_next_month then customer_id end) as retained_m1
    from cte
    GROUP BY cohort_month, channel
)
select * from cte2 ORDER BY channel,cohort_month
