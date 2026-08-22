-- Xom Data · Tickets still valid
-- Problem: https://xomdata.com/practice/easy-count-010
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    SUM(CASE WHEN status='Valid' THEN 1 ELSE 0 END) AS valid_tickets
FROM tickets
