-- Xom Data · Patients with blood type O+
-- Problem: https://xomdata.com/practice/easy-where-020
-- Solved: 2026-08-20

SELECT
    full_name,
    blood_type
from patients
WHERE blood_type = 'O+'
order by full_name
