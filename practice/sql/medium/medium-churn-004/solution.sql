-- Xom Data · Sổ đen những khách đã im lặng quá lâu
-- Problem: https://xomdata.com/practice/medium-churn-004
-- Solved: 2026-09-02

select
    customer_id,
    max(order_date) as last_order_date,
    julianday('2024-06-30') - julianday(max(order_date)) as days_silent
FROM  orders 
where order_date <='2024-06-30'
group by customer_id
having julianday('2024-06-30') - julianday(max(order_date))>90
order by days_silent desc, customer_id
