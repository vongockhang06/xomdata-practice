# Xom Data · Pad an order id with leading zeros
# Problem: https://xomdata.com/practice/py-pad-order-id
# Solved: 2026-08-15

def pad_order_id(number):
    s=str(number)
    return f'{s:0>5}'
