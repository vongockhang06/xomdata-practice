# Xom Data · Merge intervals
# Problem: https://xomdata.com/practice/py-merge-intervals
# Solved: 2026-08-28

def merge_intervals(intervals):
    if not intervals:
        return []
    if len(intervals)==1:
        return intervals
    intervals=sorted(intervals,key=lambda x:x[0])
    res=[]
    for i in range(1,len(intervals)):
        if not res:
            prev_inter=intervals[i-1]
        else:
            prev_inter=res[-1]
        curr_inter=intervals[i]

        if curr_inter[0]<=prev_inter[1]:
            if not res:
                res.append([prev_inter[0],max(prev_inter[1], curr_inter[1])])
            else:
                res[-1]=[prev_inter[0],max(prev_inter[1], curr_inter[1])]
        else:
            if not res:
                res.append(prev_inter)
                res.append(curr_inter)
            else:
                res.append(curr_inter)
    return res
