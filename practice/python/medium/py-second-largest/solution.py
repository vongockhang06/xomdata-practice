# Xom Data · Second largest value
# Problem: https://xomdata.com/practice/py-second-largest
# Solved: 2026-08-21

def second_largest(numbers):
    if not numbers:
        return None
    maximum=max(numbers)
    second_maxium = numbers[0]
    for i in numbers:
        if maximum>i>second_maxium:
            second_maxium=i
    if second_maxium==maximum:
        return None
    return second_maxium
