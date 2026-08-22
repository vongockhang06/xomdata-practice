-- Xom Data · Users who never took a ride
-- Problem: https://xomdata.com/practice/easy-leftjoin-001
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    user_name,
    joined_date
from users 
where id NOT IN  (SELECT user_id FROM rides)
