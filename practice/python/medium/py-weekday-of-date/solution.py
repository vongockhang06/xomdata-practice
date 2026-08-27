# Xom Data · Weekday of a specific date
# Problem: https://xomdata.com/practice/py-weekday-of-date
# Solved: 2026-08-27

from datetime import datetime,date
def weekday_of(text):
    d = datetime.strptime(text,'%Y-%m-%d')
    date_dict = {0:'Monday',1:'Tuesday',2:'Wednesday',3:'Thursday',4:'Friday',5:'Saturday',6:'Sunday'}
    return date_dict[d.weekday()]
