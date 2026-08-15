# Xom Data · Library late return fee
# Problem: https://xomdata.com/practice/py-late-fee
# Solved: 2026-08-15

def late_fee(days_late, fee_per_day):
    return 0 if days_late<=0 else days_late*fee_per_day
