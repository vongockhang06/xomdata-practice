# Xom Data · Read a config string into a lookup table
# Problem: https://xomdata.com/practice/py-parse-key-value
# Solved: 2026-08-26

from collections import defaultdict
def parse_config(text):
    text=text.replace(' ','')
    size=len(text)
    if not text:
        return {}
    text = text[:size-1] if text[-1]==';' else text
    pairs = text.split(';')
    new_pair=[]
    for pair in pairs:
        temp=pair.replace('=',' ').split(' ')
        if "".join(temp):
            new_pair.append(temp)
    res=defaultdict(str)
    for key, value in new_pair:
        res[key]=value
    return dict(res)
