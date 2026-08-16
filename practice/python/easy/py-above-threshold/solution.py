# Xom Data · Count students above the benchmark
# Problem: https://xomdata.com/practice/py-above-threshold
# Solved: 2026-08-16

def count_above(numbers, threshold):
    return len([x for x in numbers if x >threshold])
