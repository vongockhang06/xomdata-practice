# Xom Data · Convert minutes to hours and minutes
# Problem: https://xomdata.com/practice/py-time-format
# Solved: 2026-08-16

def format_duration(minutes):
    h = minutes//60
    m = minutes%60
    return f'{h}:{m:02}'
