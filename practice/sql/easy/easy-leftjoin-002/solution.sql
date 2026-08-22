-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    member_name,
    COALESCE(sum(amount),0) as total_spent
FROM members m FULL JOIN bills b ON m.id=b.member_id
GROUP BY m.id,member_name
ORDER BY member_name
