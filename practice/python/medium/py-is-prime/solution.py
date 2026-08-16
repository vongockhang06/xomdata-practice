# Xom Data · Check prime number
# Problem: https://xomdata.com/practice/py-is-prime
# Solved: 2026-08-16

def is_prime(n):
    if n<2:
        return False
    elif n<=3:
        return True
    if n%2==0 or n%3==0:
        return False
    i=5
    while i*i<=n:
        if n%i==0 or n%(i+2)==0:
            return False
        i+=6
    return True
