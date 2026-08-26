# Xom Data · Roman to integer
# Problem: https://xomdata.com/practice/py-roman-to-int
# Solved: 2026-08-26

def roman_to_int(s):
    roman = {'I':1, 'V':5, 'X':10, 'L':50, 'C':100, 'D':500, 'M':1000}
    size= len(s)
    if size==1:
        return roman[s]
    total = roman[s[size-1]]
    for i in range(size-2,-1,-1):
        prev_char = s[i+1]
        curr_char = s[i]
        prev_val = roman[prev_char]
        curr_val = roman[curr_char]
        if curr_val<prev_val:
            total=total-curr_val
        else:
            total+=curr_val
    return total
