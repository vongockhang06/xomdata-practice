# Xom Data · Split a tag list out of one input box
# Problem: https://xomdata.com/practice/py-split-tags
# Solved: 2026-08-16

def split_tags(text):
    temp=text.replace(' ','').split(",")
    return [x for x in temp if x]
