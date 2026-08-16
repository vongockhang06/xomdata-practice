# Xom Data · Count vowels in a name
# Problem: https://xomdata.com/practice/py-vowels
# Solved: 2026-08-16

def count_vowels(name):
    vowel='aeiouAEIOU'
    count=0
    for i in name:
        if i in vowel:
            count=count+1
    return count
