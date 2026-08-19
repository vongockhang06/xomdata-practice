-- Xom Data · Delivery performance by size class
-- Problem: https://xomdata.com/practice/medium-case-160
-- Solved: 2026-08-19

WITH cte AS(
    SELECT
        t.vehicle_type,
        t.capacity_tons,
        COUNT(*) AS shipment_count,
        SUM(CASE WHEN d.results='success' THEN 1 ELSE 0 END) AS delivered
    FROM deliveries d 
    JOIN shipments s ON d.shipment_id=s.id
    JOIN trucks t ON s.truck_id=t.id    
    GROUP BY t.id, t.vehicle_type,t.capacity_tons
)
,cte2 AS(
SELECT
    vehicle_type,
    capacity_tons,
    shipment_count,
    CASE WHEN capacity_tons>=10 THEN 'Large Truck'
        WHEN capacity_tons>=5 THEN 'Medium Truck'
        ELSE 'Small Truck' END AS size_class,
    delivered,
    ROUND(delivered::NUMERIC/shipment_count*100,2) AS delivery_rate
FROM cte
)
SELECT
    *,
    RANK() OVER(PARTITION BY size_class ORDER BY delivery_rate DESC) AS rank_in_size
FROM cte2
ORDER BY size_class, rank_in_size,vehicle_type
