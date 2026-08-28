# Xom Data · Maximum product subarray
# Problem: https://xomdata.com/practice/py-max-product-subarray
# Solved: 2026-08-28

def max_product(numbers):
    size =len(numbers)
    max_pro=numbers[0]
    min_pro=numbers[0]
    res=numbers[0]
    for i in range(1,size):
        if numbers[i]<0:
            max_pro,min_pro=min_pro,max_pro
        max_pro = max(numbers[i],numbers[i]*max_pro)
        min_pro = min(numbers[i],numbers[i]*min_pro)
        res = max(max_pro,res)
    return res
