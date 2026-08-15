# Xom Data · Branch leading on revenue
# Problem: https://xomdata.com/practice/py-best-branch
# Solved: 2026-08-15

def best_branch(branches):
    m=-100000
    city=None
    if len(branches)==0:
        return None
    for key,value in branches.items():
        if value > m:
            city= key
            m=value
    return city
