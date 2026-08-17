# Xom Data · Earliest and latest date in the ledger
# Problem: https://xomdata.com/practice/py-earliest-latest
# Solved: 2026-08-17

from datetime import datetime
def date_span(dates):
    if not dates:
        return None
    list_date = [datetime.strptime(x,'%Y-%m-%d') for x in dates]
    ma = datetime.strftime(max(list_date), '%Y-%m-%d')
    mi = datetime.strftime(min(list_date), '%Y-%m-%d')
    return (mi,ma)
