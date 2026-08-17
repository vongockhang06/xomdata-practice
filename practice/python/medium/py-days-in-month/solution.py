# Xom Data · How many days a given month has
# Problem: https://xomdata.com/practice/py-days-in-month
# Solved: 2026-08-17

def is_leap_year(year):
    return year%4==0 and (year%100!=0 or year%400==0)
def days_in_month(year, month):
    if is_leap_year(year) and month==2:
        return 29
    if month==2:
        return 28
    if month in [1,3,5,7,8,10,12]:
        return 31
    else:
        return 30
