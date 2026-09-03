-- Xom Data · Doanh thu đội nón ra đi cùng khách cũ
-- Problem: https://xomdata.com/practice/medium-churn-007
-- Solved: 2026-09-03

with sta as(
select
    customer_id,
    max(order_date) as last_order_date,
    sum(amount) as lost_revenue
from orders
group by customer_id
)
, silent_cust as(
    select
        customer_id
    from orders
    where order_date<='2024-06-30'
    group by customer_id
    having julianday('2024-06-30') - julianday(max(order_date)) >90
)
select
    st.*
from sta st join silent_cust sc on st.customer_id=sc.customer_id
order by lost_revenue desc , st.customer_id
