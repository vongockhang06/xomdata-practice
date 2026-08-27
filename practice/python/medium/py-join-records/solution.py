# Xom Data · Join two record lists by id
# Problem: https://xomdata.com/practice/py-join-records
# Solved: 2026-08-27

def join_by_id(orders, customers):
    if not orders or not customers:
        return []
    customer_id_from_orders = set([x['customer_id'] for x in orders])
    customer_id_from_customers = set([x['id'] for x in customers])
    common_customer = customer_id_from_customers & customer_id_from_orders
    if not common_customer:
        return []
    res=[]
    for order in orders:
        temp={}
        if order['customer_id'] not in common_customer:
            continue
        for customer in customers:
            if order['customer_id'] ==customer['id']:
                temp['name']=customer['name']
        temp['amount']=order['amount']
        res.append(temp)
    return res
