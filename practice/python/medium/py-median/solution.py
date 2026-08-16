# Xom Data · Median of a list
# Problem: https://xomdata.com/practice/py-median
# Solved: 2026-08-16

def median(numbers):
    size=len(numbers)
    mid=(0+size-1)//2
    num = sorted(numbers)
    if size%2==0:
        return round((num[mid]+num[mid+1])/2,2)
    else:
        return sorted(numbers)[mid]
