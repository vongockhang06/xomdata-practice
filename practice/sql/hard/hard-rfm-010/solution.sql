-- Xom Data · Tấm bản đồ mười một bộ lạc khách hàng
-- Problem: https://xomdata.com/practice/hard-rfm-010
-- Solved: 2026-09-17

with cte as(
    SELECT
        customer_id,
        count(*) as total_orders,
        max(order_date) as recent_date
    from orders
    GROUP BY customer_id
)
, cte2 as(
    select
        customer_id,
        6-NTILE(5) over(ORDER BY total_orders desc,customer_id) as f,
        6-NTILE(5) over(ORDER BY recent_date desc,customer_id) as r
    from cte 
)
, cte3 as(
    select
        customer_id,
        case when r= 5 AND f >= 4 then 'Champions'          
            when r>= 4 AND f >= 3 then 'Loyal'              
            when r>= 4 AND f >= 1 then 'Potential Loyalist' 
            when r= 3 AND f >= 4 then 'Need Attention'     
            when r= 3 AND f >= 2 then 'About To Sleep'     
            when r= 3 then 'Promising'          
            when r= 2 AND f >= 4 then 'At Risk'            
            when r= 2 AND f >= 2 then 'Hibernating'        
            when r= 2          then 'Lost Cheap'         
            when r= 1 AND f >= 3 then 'Cannot Lose Them'   
            else   'Lost' end as segment         
    from cte2 
)
select
    segment,
    count(*) as customer_count
from cte3 GROUP BY segment
ORDER BY customer_count desc, segment
