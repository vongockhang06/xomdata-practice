-- Xom Data · Top 10 most-engaged posts
-- Problem: https://xomdata.com/practice/medium-groupby-097
-- Solved: 2026-08-24

WITH cte AS(
SELECT
    user_id,
    post_type,
    post_date,
    like_count+comment_count+share_count AS total_interactions
FROM posts
)
, cte2 AS(
SELECT
    *,
    RANK() OVER( ORDER BY total_interactions DESC)  AS overall_rank,
    ROW_NUMBER() OVER( PARTITION BY user_id ORDER BY total_interactions DESC,post_date) AS rank_in_author
FROM cte 
)
SELECT
    full_name,
    post_type,
    post_date,
    total_interactions,
    overall_rank,
    rank_in_author,
    ROUND(total_interactions::NUMERIC/(SELECT MAX(total_interactions) FROM cte2)*100.0,2) AS  pct_of_top
FROM cte2 c
JOIN users u ON c.user_id=u.id
ORDER BY overall_rank, full_name, rank_in_author
