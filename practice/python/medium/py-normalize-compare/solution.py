# Xom Data · Match product names despite small differences
# Problem: https://xomdata.com/practice/py-normalize-compare
# Solved: 2026-08-26

def delete_whitespace(temp_a):
    countspace=0
    new_a=''
    for i in temp_a:
        if i!=' ':
            new_a=new_a+i
            countspace=0
        else:
            if countspace==0:
                new_a=new_a+i
                countspace=countspace+1
    return new_a

def same_product(a, b):
    temp_a=a.replace(',',' ').replace('.',' ').replace('-',' ').lower().strip()
    temp_b=b.replace(',',' ').replace('.',' ').replace('-',' ').lower().strip()
    new_a=delete_whitespace(temp_a)
    new_b=delete_whitespace(temp_b)
    return new_a==new_b
