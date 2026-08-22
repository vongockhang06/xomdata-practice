-- Xom Data · Parcels bound for Da Nang
-- Problem: https://xomdata.com/practice/easy-join-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    tracking_code,
    recipient_name
FROM recipients r 
JOIN parcels p ON r.id=p.recipient_id
WHERE city='Da Nang'
