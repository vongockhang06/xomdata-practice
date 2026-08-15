# Xom Data · Count products with an even code
# Problem: https://xomdata.com/practice/py-count-even
# Solved: 2026-08-15

def count_even(numbers):
    return len([x for x in numbers if x%2==0])
