# Xom Data · Add goods into the stock table
# Problem: https://xomdata.com/practice/py-update-stock
# Solved: 2026-08-16

def add_stock(stock, code, qty):
    if code not in stock:
        stock.setdefault(code,qty)
    else:
        stock[code]+=qty
    return stock
