# Xom Data · Split an ISO date string into parts
# Problem: https://xomdata.com/practice/py-parse-date-parts
# Solved: 2026-08-26

def date_parts(text):
    return (int(text[:4]),int(text[5:7]),int(text[-2:]))
