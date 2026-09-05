-- Xom Data · Most common 3-step user path
-- Problem: https://xomdata.com/practice/hard-pathanalysis-001
-- Solved: 2026-09-05

WITH RECURSIVE l AS (
    SELECT
        user_id,
        page,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY viewed_at) AS seq
    FROM page_views
)
, label as(
    select
        *,
        max(seq) over(PARTITION BY user_id) as end_page
    from l 
)
, cte AS (
    SELECT
        user_id,
        page,
        seq,
        1 as depth
    FROM label
    WHERE seq<=end_page-2
    UNION ALL
    SELECT
        c.user_id,
        CASE 
            WHEN c.depth = 3 THEN c.page || pv.page
            ELSE c.page || ' > ' || pv.page 
        END AS page,
        pv.seq,
        depth+1
    FROM cte c
    JOIN label pv 
        ON pv.user_id = c.user_id 
       AND pv.seq = c.seq + 1
    WHERE c.depth <= 3
)
SELECT 
    page as path,
    count(DISTINCT user_id) as n_users
FROM cte
where depth=3
group by page
order by n_users desc, path
limit 10
