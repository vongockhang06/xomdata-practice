# Xom Data · Raise a flag when any order runs late
# Problem: https://xomdata.com/practice/py-any-overdue
# Solved: 2026-08-16

def has_overdue(days_late):
    return True if [x for x in days_late if x > 0] else False
