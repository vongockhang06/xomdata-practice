-- Xom Data · Grand final leaderboard
-- Problem: https://xomdata.com/practice/medium-rank-001
-- Solved: 2026-08-29

-- Viết SQL của bạn ở đây
SELECT
    rank() over(order by points desc) as final_rank,
    player_name,
    points
from players
order by final_rank,player_name
