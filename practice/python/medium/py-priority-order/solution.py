# Xom Data · Order the support ticket queue
# Problem: https://xomdata.com/practice/py-priority-order
# Solved: 2026-08-26

def sort_by_priority(tickets):
    priority = {'high':1,'medium':2,'low':3}
    temp = sorted(tickets,key=lambda x: priority[x[1]])
    return [x for x,y in temp]
