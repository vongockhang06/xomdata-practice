# Xom Data · Age at a given date
# Problem: https://xomdata.com/practice/py-age-at-date
# Solved: 2026-08-27

from datetime import datetime, timedelta
def age_on(birth, on_date):
    d1=datetime.strptime(birth,'%Y-%m-%d')
    d2=datetime.strptime(on_date,'%Y-%m-%d')
    if d2.month<d1.month or (d2.month==d1.month and d2.day<d1.day):
        return d2.year-1-d1.year
    return d2.year-d1.year
