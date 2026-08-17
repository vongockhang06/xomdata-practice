# Xom Data · Add up shift durations
# Problem: https://xomdata.com/practice/py-duration-sum
# Solved: 2026-08-17

def total_time(durations):
    if not durations:
        return '00:00'
    m=0
    h=0
    for i in durations:
        temp=i.split(':')
        h += int(temp[0])
        m +=int(temp[1])
    h+= m//60
    m=m%60
    return f'{h:02}:{m:02}'
