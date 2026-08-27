# Xom Data · Top-selling employee per region
# Problem: https://xomdata.com/practice/py-top-seller-region
# Solved: 2026-08-27

from collections import defaultdict
def top_seller(records):
    find_sum=defaultdict(int)
    for area,name,val in records:
        find_sum[(area,name)] +=val
    
    temp  = sorted(find_sum.items(),key=lambda x: -x[1])
    res={}
    for i in temp:
        area = i[0][0]
        name = i[0][1]
        if area not in res:
            res[area]=name
    return res
