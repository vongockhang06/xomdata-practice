# Xom Data · Check leap year
# Problem: https://xomdata.com/practice/py-leap-year
# Solved: 2026-08-15

def is_leap_year(year):
    if year%100==0:
        if year%400==0:
            return True
        else:
            return False
    elif year%4==0:
        return True
    else: 
        return False
