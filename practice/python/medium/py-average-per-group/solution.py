# Xom Data · Average score by class
# Problem: https://xomdata.com/practice/py-average-per-group
# Solved: 2026-08-27

from collections import defaultdict
def average_per_group(pairs):
    if not pairs:
        return {}
    grby  = defaultdict(list)
    for cl, grade in pairs:
        grby[cl].append(grade)
    
    res={}
    for key, val in grby.items():
        res[key]=round(sum(val)/len(val),2)
    return res
