-- Xom Data · This invoice's share of the client's spend
-- Problem: https://xomdata.com/practice/medium-winjoin-005
-- Solved: 2026-08-31

-- Viết SQL của bạn ở đây
select
    client_name,
    invoice_code,
    amount,
    round( amount::NUMERIC/SUM(amount) over(PARTITION BY client_name rows between unbounded preceding and unbounded following) *100   ,2) as pct_of_client
from invoices i join clients c on i.client_id=c.id
order by  client_name,amount desc, invoice_code
