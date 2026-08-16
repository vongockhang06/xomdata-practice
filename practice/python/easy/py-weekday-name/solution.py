# Xom Data · Weekday name from its number
# Problem: https://xomdata.com/practice/py-weekday-name
# Solved: 2026-08-16

def weekday_name(n):
    weekday ={1: "Monday",2: "Tuesday",3: "Wednesday",4: "Thursday",5: "Friday",6: "Saturday", 7: "Sunday"}
    return weekday.get(n,None)
