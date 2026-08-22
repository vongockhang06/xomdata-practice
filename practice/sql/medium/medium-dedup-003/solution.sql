-- Xom Data · Latest readings and over-limit alerts
-- Problem: https://xomdata.com/practice/medium-dedup-003
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
with cte as(
SELECT
    sensor_name,
    reading_date,
    temp_c,
    max_temp,
    ROW_NUMBER() OVER(PARTITION BY sensor_name order by reading_date desc) as latest
FROM sensors s 
JOIN readings r ON s.id=r.sensor_id
)
select
    sensor_name,
    reading_date,
    temp_c,
    max_temp,
    case when temp_c>max_temp then 'Alert' else 'Normal' end as status
from cte
where latest=1
