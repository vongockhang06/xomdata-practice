# Xom Data · Position of the priciest item in the table
# Problem: https://xomdata.com/practice/py-index-of-max
# Solved: 2026-08-15

def index_of_max(prices):
    m = max(prices) if prices else None
    if m is None:
        return -1
    return prices.index(m)
