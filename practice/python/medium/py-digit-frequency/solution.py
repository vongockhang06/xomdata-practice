# Xom Data · Digit frequency
# Problem: https://xomdata.com/practice/py-digit-frequency
# Solved: 2026-08-17

from collections import Counter
def digit_frequency(number):
    number = str(number)
    return dict(Counter(number))
