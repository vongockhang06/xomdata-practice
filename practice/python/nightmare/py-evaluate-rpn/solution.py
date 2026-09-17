# Xom Data · Evaluate reverse polish notation
# Problem: https://xomdata.com/practice/py-evaluate-rpn
# Solved: 2026-09-17

def eval_rpn(tokens):
    size=len(tokens)
    if size==1:
        return int(tokens[0])
    nums=[]    
    for char in tokens:
        if char[0]=='-':
            nums.append(0-int(char[1:]))
        elif char.isdigit():
            nums.append(int(char))
        else:
            if char=='+':
                temp=nums[-1]+nums[-2]
            elif char=='-':
                temp=nums[-2]-nums[-1]
            elif char=='*':
                temp=nums[-2]*nums[-1]
            elif char=='/':
                temp=int(nums[-2]/nums[-1])
            nums.pop()
            nums.pop()
            nums.append(temp)
    return nums[0]
