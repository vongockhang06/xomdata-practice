# Xom Data · Next working day
# Problem: https://xomdata.com/practice/py-next-workday
# Solved: 2026-08-26

from datetime import date, datetime,timedelta
def next_workday(text):
    d = datetime.strptime(text,'%Y-%m-%d')
    i = d.weekday()
    plus_day=0
    if i==4:
        plus_day=3
    elif i==5:
        plus_day=2
    else:
        plus_day=1
    return datetime.strftime(d+timedelta(days=plus_day),'%Y-%m-%d')
