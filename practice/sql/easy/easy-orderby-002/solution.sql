-- Xom Data · Room price list by tier
-- Problem: https://xomdata.com/practice/easy-orderby-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
select
    room_no,
    room_type,
    price
from rooms
ORDER BY room_type,price,room_no
