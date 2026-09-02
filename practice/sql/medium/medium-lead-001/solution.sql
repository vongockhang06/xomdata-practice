-- Xom Data · Each device's next service date
-- Problem: https://xomdata.com/practice/medium-lead-001
-- Solved: 2026-09-02

-- Viết SQL của bạn ở đây
select
    device_code,
    service_date,
    lead(service_date) over(PARTITION BY device_code ORDER BY service_date) as next_service
from service_log
ORDER BY device_code,service_date
