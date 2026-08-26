# Xom Data · Record sales up to each day
# Problem: https://xomdata.com/practice/py-running-max
# Solved: 2026-08-26

def running_max(values):
    if not values:
        return values
    size=len(values)
    prefix_max=[0]*size
    prefix_max[0]=values[0]
    for i in range(1,size):
        prefix_max[i]=max(prefix_max[i-1],values[i])
    return prefix_max
