# Xom Data · Valid nested parentheses
# Problem: https://xomdata.com/practice/py-valid-brackets
# Solved: 2026-08-28

def is_valid(s):
    if not s:
        return True
    stack = []
    corrseponding_bracket ={')':'(', ']':'[', '}':'{'}
    for i in s:
        if i in '([{':
            stack.append(i)
        else:
            if not stack:
                return False
            if stack[-1]!=corrseponding_bracket[i]:
                return False
            stack.pop()
    if stack:
        return False
    return True
