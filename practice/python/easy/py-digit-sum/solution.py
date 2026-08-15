# Xom Data · Sum of digits in the code
# Problem: https://xomdata.com/practice/py-digit-sum
# Solved: 2026-08-15

def digit_sum(number):
    total=0
    while number !=0:
        digit = number%10
        number=number//10
        total+=digit
    return total
