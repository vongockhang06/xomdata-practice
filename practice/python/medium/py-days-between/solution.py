# Xom Data · Distance between two dates
# Problem: https://xomdata.com/practice/py-days-between
# Solved: 2026-08-17

import datetime
def days_between(a, b):
    a = datetime.datetime.strptime(a, '%Y-%m-%d')
    b = datetime.datetime.strptime(b, '%Y-%m-%d')
    lag = abs(a-b)
    return lag.days
