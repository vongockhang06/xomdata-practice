# Xom Data · Check palindrome
# Problem: https://xomdata.com/practice/py-palindrome
# Solved: 2026-08-15

def is_palindrome(text):
    return text.lower()==text.lower()[::-1]
