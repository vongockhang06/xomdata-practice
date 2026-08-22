-- Xom Data · Most watched videos this week
-- Problem: https://xomdata.com/practice/easy-orderby-003
-- Solved: 2026-08-22

-- Viết SQL của bạn ở đây
SELECT
    video_title,
    weekly_views
FROM videos
ORDER BY weekly_views desc, video_title
