# Xom Data · Count pairs with a target sum
# Problem: https://xomdata.com/practice/py-two-sum-count
# Solved: 2026-08-25

from collections import defaultdict
def count_pairs(numbers, target):
    seen = defaultdict(int)
    count = 0
    for num in numbers:
        complement = target - num
        count += seen[complement]
        seen[num] += 1
    return count
