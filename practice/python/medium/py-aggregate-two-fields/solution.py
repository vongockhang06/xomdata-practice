# Xom Data · Total and order count per region
# Problem: https://xomdata.com/practice/py-aggregate-two-fields
# Solved: 2026-08-27

from collections import defaultdict
def summarize(orders):
    res=defaultdict(dict)
    visited_area=[]
    for order in orders:
        key = order['region']
        val = order['amount']

        if key not in visited_area:
            res[key]['total']=val
            res[key]['count']=1
            visited_area.append(key)
        else:
            res[key]['total']+=val
            res[key]['count']+=1
    return dict(res)
