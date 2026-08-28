# Xom Data · Longest substring without repeating characters
# Problem: https://xomdata.com/practice/py-longest-unique-substring
# Solved: 2026-08-28

from collections import defaultdict
def longest_unique(s):
    if not s:
        return 0
    res=0
    count=0
    d  = {}
    l,r=0,0
    size = len(s)
    while r<size:
        char = s[r]
        if char not in d or d[char]==0:
            d[char]=1
            count+=1
        else:
            res=max(res,count)
            d[char]=1
            while s[l] !=char:
                d[s[l]]-=1
                l+=1
                count-=1
        r+=1
    res=max(res,count)
    return res
