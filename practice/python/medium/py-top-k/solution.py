# Xom Data · Top K largest elements
# Problem: https://xomdata.com/practice/py-top-k
# Solved: 2026-08-27

def top_k(numbers, k):
    size= len(numbers)
    if k==0:
        return []
    if k>=size:
        return sorted(numbers,reverse=True)
    return sorted(numbers,reverse=True)[:k]
