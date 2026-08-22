-- Xom Data · Today's showtimes in time order
-- Problem: https://xomdata.com/practice/easy-join-004
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    s.start_time,
    m.title,
    s.screen
FROM movies m
JOIN showtimes s 
ON m.id=s.movie_id
ORDER BY start_time,title
