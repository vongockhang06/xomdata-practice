-- Xom Data · Goals and cards by team
-- Problem: https://xomdata.com/practice/medium-join-186
-- Solved: 2026-08-29

WITH cte AS(
    SELECT
        team_name,
        city,
        COUNT(DISTINCT p.id) AS player_count,
        COUNT(DISTINCT g.id) AS total_goals_scored,
        COUNT(DISTINCT pen.id) AS penalty_count,
        ROUND(count(DISTINCT g.id)::NUMERIC/count(DISTINCT p.id),2) as goals_per_player,
        ROUND(count(DISTINCT pen.id)::NUMERIC/count( DISTINCT p.id),2) as cards_per_player
    FROM players p 
    JOIN teams t ON p.team_id=t.id
    LEFT JOIN goals g ON p.id=g.player_id
    LEFT JOIN penalties pen ON p.id=pen.player_id
    GROUP BY team_name,city
)
SELECT
    *,
    RANK() OVER(ORDER BY total_goals_scored DESC) AS scoring_rank,
    SUM(total_goals_scored) OVER(ORDER BY total_goals_scored DESC) AS cumulative_goals
FROM cte 
ORDER BY scoring_rank,team_name
