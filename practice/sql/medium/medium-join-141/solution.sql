-- Xom Data · Consultation revenue by doctor
-- Problem: https://xomdata.com/practice/medium-join-141
-- Solved: 2026-08-28

WITH fee_info AS(
    SELECT
        doctor_id,
        COUNT(*) AS visit_count,
        AVG(visit_fee) AS avg_exam_fee,
        SUM(visit_fee) AS total_exam_fee
    FROM medical_visits
    GROUP BY doctor_id
)
SELECT
    faculty_name,
    full_name AS doctor_name,
    visit_count,
    avg_exam_fee,
    total_exam_fee,
    RANK() OVER(ORDER BY total_exam_fee DESC) AS overall_rank,
    DENSE_RANK() OVER(PARTITION BY faculty_name ORDER BY total_exam_fee DESC) AS rank_in_faculty
FROM fee_info f
JOIN doctors d ON f.doctor_id=d.id
JOIN faculties fa ON fa.id=d.faculty_id
ORDER BY total_exam_fee DESC, doctor_name
LIMIT 15
