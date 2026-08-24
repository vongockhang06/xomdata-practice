-- Xom Data · Showtime count and average ticket price per film
-- Problem: https://xomdata.com/practice/medium-join-076
-- Solved: 2026-08-24

WITH cte AS(
    SELECT
        movie_name,
        genres,
        COUNT(*) AS showtime_count,
        AVG(ticket_price) AS avg_ticket_price
    FROM movies m 
    JOIN showtimes s ON m.id=s.movie_id
    GROUP BY movie_name, genres
)
SELECT
    *,
    DENSE_RANK() OVER(PARTITION BY genres ORDER BY avg_ticket_price DESC) AS rank_in_genre,
    FIRST_VALUE(movie_name) OVER(PARTITION BY genres ORDER BY avg_ticket_price DESC) AS top_movie_in_genre
FROM cte
ORDER BY genres,rank_in_genre,movie_name
