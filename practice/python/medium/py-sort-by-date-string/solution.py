# Xom Data · Order applications by submission date
# Problem: https://xomdata.com/practice/py-sort-by-date-string
# Solved: 2026-08-26

from datetime import datetime
def by_date(records):
    temp = [(x,datetime.strptime(y,'%d/%m/%Y')) for x,y in records]
    temp=sorted(temp,key=lambda x: (x[1],x[0]))
    return [x for x,y in temp]
