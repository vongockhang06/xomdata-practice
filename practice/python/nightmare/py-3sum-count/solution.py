# Xom Data · 3Sum
# Problem: https://xomdata.com/practice/py-3sum-count
# Solved: 2026-10-06

def count_triplets(numbers):
    numbers=sorted(numbers)
    res=[]
    i=0
    size=len(numbers)
    while i<size:
        if i>0 and numbers[i]==numbers[i-1]:
            i+=1
            continue
        
        l,r=i+1,len(numbers)-1
        while l<r:
            total=numbers[i]+numbers[l]+numbers[r]
            if total==0:
                res.append([numbers[i],numbers[l],numbers[r]])
                l+=1
                r-=1
                while l<r and numbers[l]==numbers[l-1]:
                    l+=1
                while l<r and numbers[r]==numbers[r+1]:
                    r-=1;
            elif total<0:
                l+=1
            else:
                r-=1
        i+=1
    return len(res)
