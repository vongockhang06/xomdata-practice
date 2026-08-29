-- Xom Data · Rank hotels by room price within each destination
-- Problem: https://xomdata.com/practice/medium-join-155
-- Solved: 2026-08-29

WITH cte AS(
    SELECT
        hotel_id,
        COUNT(*) AS room_count,
        MIN(nightly_rate) AS min_price,
        MAX(nightly_rate) AS max_price,
        ROUND(AVG(nightly_rate)) AS avg_price,
        MAX(nightly_rate)-MIN(nightly_rate) AS price_spread
    FROM hotel_rooms
    GROUP BY hotel_id
    HAVING COUNT(*)>=2
)
SELECT
    hotel_name,
    star_class,
    destination_name,
    room_count,
    min_price,
    max_price,
    avg_price,
    price_spread,
    RANK() OVER(PARTITION BY destination_id ORDER BY avg_price DESC) AS rank_in_destination
FROM cte c
JOIN hotels h ON c.hotel_id=h.id
JOIN destinations d ON h.destination_id=d.id
ORDER BY destination_name, rank_in_destination, hotel_name
