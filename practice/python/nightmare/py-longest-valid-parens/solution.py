# Xom Data · Longest valid parentheses
# Problem: https://xomdata.com/practice/py-longest-valid-parens
# Solved: 2026-09-10

def longest_valid(s):
    if not s:
        return 0
    m=0
    stack = [-1]
    #-1 as base index boundary
    #store unmatched, matched one annuls each other. Use current index minus the last unmatched to know the matched length 
    for i,char in enumerate(s):
        if char=='(':
            stack.append(i)
        else:
            stack.pop()
            if not stack:
                stack.append(i)
            else:
                m=max(m,i-stack[-1])
    return m
