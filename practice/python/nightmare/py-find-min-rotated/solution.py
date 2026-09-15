# Xom Data · Find minimum in rotated sorted array
# Problem: https://xomdata.com/practice/py-find-min-rotated
# Solved: 2026-09-15

def find_min(nums):
    size=len(nums)
    if size==1:
        return nums[0]
    for i in range(1,size):
        if nums[i]<nums[i-1]:
            return nums[i]
    return nums[0]
