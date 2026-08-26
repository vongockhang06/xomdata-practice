# Xom Data · Order queue by priority and value
# Problem: https://xomdata.com/practice/py-sort-two-keys
# Solved: 2026-08-26

def sort_orders(orders):
    return [x['id'] for x in sorted(orders,key=lambda x:(x['priority'],-x['amount']))]
