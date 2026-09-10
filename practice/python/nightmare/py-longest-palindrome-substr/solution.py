# Xom Data · Longest palindromic substring
# Problem: https://xomdata.com/practice/py-longest-palindrome-substr
# Solved: 2026-09-10

def is_palindrome(s: str)->bool:
    size=len(s)
    ptr=0
    while ptr<size//2:
        if s[ptr]!=s[size-1-ptr]:
            return False
        ptr+=1
    return True
def longest_palindrome(s):
    size=len(s)
    m=0
    start,end=0,0
    if not s:
        return ""
    for i in range(size):
        for j in range(i+1,size+1):
            substr=s[i:j]
            if is_palindrome(substr):
                if len(substr)>m:
                    m=len(substr)
                    start=i
                    end=j
    return s[start:end]
