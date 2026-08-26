# Xom Data · Missing number
# Problem: https://xomdata.com/practice/py-missing-number
# Solved: 2026-08-26

def missing_number(numbers):
    n=len(numbers)+1
    return int(n*(n+1)/2) - sum(numbers)
