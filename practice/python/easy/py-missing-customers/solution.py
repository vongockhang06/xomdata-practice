# Xom Data · Customers who only bought at the first branch
# Problem: https://xomdata.com/practice/py-missing-customers
# Solved: 2026-08-15

def only_in_first(a, b):
    return list(set(a)-set(b))
