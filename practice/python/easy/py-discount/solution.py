# Xom Data · Compute price after discount
# Problem: https://xomdata.com/practice/py-discount
# Solved: 2026-08-15

def final_price(price, percent):
    return round(price*(1-percent/100),2)
