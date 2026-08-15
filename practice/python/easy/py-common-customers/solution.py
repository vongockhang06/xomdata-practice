# Xom Data · Customers who bought at both branches
# Problem: https://xomdata.com/practice/py-common-customers
# Solved: 2026-08-15

def common(a, b):
    seta = set(a)
    setb = set(b)
    return list(seta & setb)
