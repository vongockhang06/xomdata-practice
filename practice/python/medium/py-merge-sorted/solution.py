# Xom Data · Merge two sorted lists
# Problem: https://xomdata.com/practice/py-merge-sorted
# Solved: 2026-08-27

def merge_sorted(a, b):
    if not a:
        return b
    if not b:
        return a
    
    pointera=0
    pointerb=0
    sizea=len(a)
    sizeb=len(b)
    res=[]
    while pointera<sizea and pointerb<sizeb:
        a_element=a[pointera]
        b_element=b[pointerb]
        if a_element<b_element:
            res.append(a_element)
            pointera+=1
        elif a_element>b_element:
            res.append(b_element)
            pointerb+=1
        else:
            res.append(a_element)
            res.append(b_element)
            pointerb+=1
            pointera+=1
    while pointera<sizea:
        a_element=a[pointera]
        res.append(a_element)
        pointera+=1
    while pointerb<sizeb:
        b_element=b[pointerb]
        res.append(b_element)
        pointerb+=1
    return res
