# Xom Data · Total revenue by month
# Problem: https://xomdata.com/practice/py-revenue-month
# Solved: 2026-08-26

from collections import defaultdict
def revenue_by_month(records):
    res=defaultdict(int)
    if not records:
        return {}
    for month,value in records:
        res[month]+=value
    return dict(res)
