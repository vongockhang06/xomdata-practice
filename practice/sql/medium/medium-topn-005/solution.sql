-- Xom Data · Top two films per genre, rank included
-- Problem: https://xomdata.com/practice/medium-topn-005
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
with cte as(
select
    genre,
     ROW_NUMBER() OVER(PARTITION BY genre ORDER BY revenue desc, title) as rank_in_genre,
    title,
    revenue
from box_office)
select
*
from cte
where rank_in_genre <=2
