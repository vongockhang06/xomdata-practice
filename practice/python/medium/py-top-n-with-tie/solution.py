# Xom Data · Best selling products board
# Problem: https://xomdata.com/practice/py-top-n-with-tie
# Solved: 2026-08-27

def top_products(sales, n):
    if not sales:
        return []
    temp = sorted(sales.items(), key=lambda x:(-x[1],x[0]))
    return [x[0] for x in temp][:n]
