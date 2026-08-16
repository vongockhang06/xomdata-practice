# Xom Data · FizzBuzz
# Problem: https://xomdata.com/practice/py-fizzbuzz
# Solved: 2026-08-16

def fizzbuzz(n):
    res=[]
    for i in range(1,n+1):
        if i%15==0:
            res.append('FizzBuzz')
        elif i%3==0:
            res.append('Fizz')
        elif i%5==0:
            res.append('Buzz')
        else:
            res.append(str(i))
    return res
