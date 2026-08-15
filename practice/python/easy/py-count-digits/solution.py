# Xom Data · Count digits in the password
# Problem: https://xomdata.com/practice/py-count-digits
# Solved: 2026-08-15

def count_digits(text):
    return len([x for x in text if x>='0' and x<='9'])
