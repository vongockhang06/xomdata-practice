# Xom Data · Container with most water
# Problem: https://xomdata.com/practice/py-container-water
# Solved: 2026-08-16

def max_area(heights):
    size = len(heights)
    l,r=0,size-1
    res =0 
    while(l<r):
        w = r-l
        h=0
        if (heights[l]>heights[r]):
            h=heights[r]           
            r-=1 
        else:
            h=heights[l]
            l+=1
        res = max(res, w*h)
    return res
