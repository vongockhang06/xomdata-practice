# Xom Data · Split a list into batches
# Problem: https://xomdata.com/practice/py-chunk-list
# Solved: 2026-08-16

def chunk(items, size):
    s = len(items)
    res=[]
    i=0
    while i < s:
        if i+size < s:
            res.append(items[i:i+size])
            i=i+size-1# it will increase 1 at the end of the loop
        else:
            res.append(items[i::])
            break
        i=i+1
    return res
