# Xom Data · Divide safely when the divisor can be zero
# Problem: https://xomdata.com/practice/py-safe-divide
# Solved: 2026-08-15

def safe_divide(a, b):
    return None if b==0 else round(a/b,2)
