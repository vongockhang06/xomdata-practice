# Xom Data · Count in-stock products
# Problem: https://xomdata.com/practice/py-in-stock
# Solved: 2026-08-15

def count_in_stock(quantities):
    return len([x for x in quantities if x>0])
