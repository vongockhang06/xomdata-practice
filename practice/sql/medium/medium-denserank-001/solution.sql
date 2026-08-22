-- Xom Data · Price tiers for rooms on sale
-- Problem: https://xomdata.com/practice/medium-denserank-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select
    room_no,
    price,
    DENSE_RANK() over(ORDER BY price desc) as price_tier
from rooms
ORDER BY price desc, room_no asc
