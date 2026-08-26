# Xom Data · Month label for a report heading
# Problem: https://xomdata.com/practice/py-month-label
# Solved: 2026-08-26

def month_label(ym):    
    d={'01':'January','02': 'February','03': 'March','04': 'April','05': 'May','06': 'June','07': 'July','08': 'August','09': 'September', '10': 'October', '11':'November', '12':'December'}
    year = ym[0:4]
    month = ym[-2:]
    return f'{d[month]} {year}'
