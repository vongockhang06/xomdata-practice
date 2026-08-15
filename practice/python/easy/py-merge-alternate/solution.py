# Xom Data · Alternate-merge two lists
# Problem: https://xomdata.com/practice/py-merge-alternate
# Solved: 2026-08-15

def merge_alternate(list1, list2):
    l1= len(list1)
    l2 = len(list2)
    pos1,pos2=0,0
    n=[]
    while pos1<l1 and pos2<l2:
        n.append(list1[pos1])
        n.append(list2[pos2])
        pos1,pos2=pos1+1,pos2+1
    while pos1<l1:
        n.append(list1[pos1])
        pos1=pos1+1
    while pos2<l2:
        n.append(list2[pos2])
        pos2=pos2+1
    return n
