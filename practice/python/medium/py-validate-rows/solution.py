# Xom Data · Per-row error table for a data entry screen
# Problem: https://xomdata.com/practice/py-validate-rows
# Solved: 2026-08-25

from collections import defaultdict
def row_errors(rows, required):
    res=defaultdict(list)
    seq=0
    for i in rows:
        temp=[]
        for field in required:
            if field not in i.keys():
                temp.append(field)
        if  temp:
            res[seq]=temp
        seq+=1
    return dict(res)
