# Xom Data · Valid parentheses
# Problem: https://xomdata.com/practice/py-balanced-brackets
# Solved: 2026-08-16

def is_balanced(text):
    stack=[]
    for c in text:
        if c=='(':
            stack.append(c)
        elif c==')':
            if not stack:
                return False
            else:
                stack.pop()
    return False if stack else True
