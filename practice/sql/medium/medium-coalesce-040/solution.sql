-- Xom Data · Book count and average price by genre
-- Problem: https://xomdata.com/practice/medium-coalesce-040
-- Solved: 2026-08-28

WITH statistic AS(
    SELECT
        genre_name,
        COUNT(b.id) AS book_count,
        COALESCE(ROUND(AVG(price)),0) AS avg_price,
        COALESCE(ROUND(MIN(price)),0) AS min_price,
        COALESCE(ROUND(MAX(price)),0) AS max_price,
        COALESCE(ROUND(MAX(price)),0) - COALESCE(ROUND(MIN(price)),0) AS price_range
    FROM books b
    RIGHT JOIN genres g ON b.genre_id=g.id
    GROUP BY genre_name
)
SELECT
    *,
    RANK() OVER(ORDER BY book_count DESC) AS coverage_rank,
    NTILE(3) OVER(ORDER BY book_count DESC, genre_name) AS library_focus
FROM statistic 
ORDER BY coverage_rank, genre_name
