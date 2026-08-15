# Xom Data · Weekly pay with overtime hours
# Problem: https://xomdata.com/practice/py-overtime-pay
# Solved: 2026-08-15

def overtime_pay(hours, rate):
    return round(hours*rate*1.0,2) if hours<=40 else round(40*rate+(hours-40)*1.5*rate,2)
