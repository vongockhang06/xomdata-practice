# Xom Data · Happy number
# Problem: https://xomdata.com/practice/py-happy-number
# Solved: 2026-09-23

def is_happy(n):
    visited={}
    visited[n]=1
    while True:
        new_n=0
        while n!=0:
            digit=n%10
            n=n//10
            new_n+=digit**2
        n=new_n
        if new_n==1:
            return True
        if visited.get(new_n)==None:
            visited[new_n]=1
        else:
            return False
