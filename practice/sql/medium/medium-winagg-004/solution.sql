-- Xom Data · How far from the server's top
-- Problem: https://xomdata.com/practice/medium-winagg-004
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
SELECT
    server,
    player_name,
    points,
    max(points) over(PARTITION BY server) - points as gap_to_top
from players
order by server,points desc,player_name
