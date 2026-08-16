# Xom Data · Insertion point that keeps a list sorted
# Problem: https://xomdata.com/practice/py-insert-position
# Solved: 2026-08-16

def insert_position(values, target):
    values=list(set(values))
    l,r = 0,len(values)-1
    while l<=r:
        mid = l + (r-l)//2
        if target==values[mid]:
            return mid
        elif target<values[mid]:
            r=mid-1
        else:
            l=mid+1
    return l
