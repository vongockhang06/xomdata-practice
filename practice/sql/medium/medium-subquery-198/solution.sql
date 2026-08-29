-- Xom Data · Top 10 most-borrowed books
-- Problem: https://xomdata.com/practice/medium-subquery-198
-- Solved: 2026-08-29

WITH find_borrow_count AS(
    SELECT
        book_id,
        COUNT(*) AS borrow_count
    FROM book_loans
    GROUP BY book_id
)
, find_reser AS(
    SELECT
        book_id,
        COUNT(*) AS pending_reservation
    FROM reservations
    WHERE status='ready_pickup'
    GROUP BY book_id
)
SELECT
    title,
    full_name as authors,
    publisher_name,
    genre_name,
    borrow_count,
    COALESCE(pending_reservation,0) AS pending_reservation ,
    borrow_count+COALESCE(pending_reservation,0) as engagement,
    DENSE_RANK() over(order by borrow_count+COALESCE(pending_reservation,0) desc) as overall_rank,
    rank() over(PARTITION BY genre_name ORDER BY borrow_count+COALESCE(pending_reservation,0) desc) as rank_in_genre
FROM books b
JOIN find_borrow_count fbc ON b.id=fbc.book_id
LEFT JOIN find_reser fr ON b.id=fr.book_id
JOIN authors auth ON b.author_id=auth.id
JOIN publishers p ON b.publisher_id=p.id
JOIN genres g ON b.genre_id=g.id 
order by overall_rank,title
limit 10
