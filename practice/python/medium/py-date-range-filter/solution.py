# Xom Data · Filter transactions inside a reporting period
# Problem: https://xomdata.com/practice/py-date-range-filter
# Solved: 2026-08-17

from datetime import datetime
def within_dates(records, start, end):
    start= datetime.strptime(start,"%Y-%m-%d")
    end = datetime.strptime(end,"%Y-%m-%d")
    res =[]
    for trans, d in records:
        d = datetime.strptime(d,"%Y-%m-%d")
        if start<=d<=end:
            res.append(trans)
    return res
