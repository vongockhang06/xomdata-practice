-- Xom Data · Booking count per branch
-- Problem: https://xomdata.com/practice/easy-leftjoin-003
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    branch_name,
    COALESCE(COUNT(bo.id),0) AS num_bookings
FROM branches b
full JOIN bookings bo ON b.id=bo.branch_id
GROUP BY b.id,b.branch_name
ORDER BY branch_name
