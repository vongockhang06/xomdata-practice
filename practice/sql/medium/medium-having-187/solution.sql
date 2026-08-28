-- Xom Data · Players with 3 or more goals
-- Problem: https://xomdata.com/practice/medium-having-187
-- Solved: 2026-08-28

WITH goal_info AS(
    SELECT
        p.id,
        COUNT(*) AS goal_count,
        COUNT(DISTINCT match_id) AS scoring_matches,
        ROUND(COUNT(*)::NUMERIC/COUNT(DISTINCT match_id),2) AS goals_per_match
    FROM players p
    JOIN goals g ON p.id=g.player_id
    GROUP BY p.id
    HAVING COUNT(*)>=3
)
, penalty_info AS(
    SELECT  
        p.id,
        COUNT(*) AS cards_received
    FROM players p
    JOIN penalties pe ON p.id=pe.player_id
    GROUP BY p.id
    HAVING COUNT(*) <5
)
SELECT
    full_name,
    positions,
    team_name,
    goal_count,
    scoring_matches,
    COALESCE(cards_received,0) AS cards_received,
    goals_per_match,
    DENSE_RANK() OVER(ORDER BY goals_per_match DESC) AS efficiency_rank,
    RANK() OVER(ORDER BY goal_count DESC) AS volume_rank
FROM players pl
JOIN teams t ON pl.team_id=t.id
JOIN goal_info g ON pl.id=g.id
LEFT JOIN penalty_info p ON pl.id=p.id
ORDER BY efficiency_rank,full_name
