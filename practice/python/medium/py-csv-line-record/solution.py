# Xom Data · Match a CSV line to its column names
# Problem: https://xomdata.com/practice/py-csv-line-record
# Solved: 2026-08-17

from collections import defaultdict
def to_record(header, line):
    line_list = line.split(',')
    header_len = len(header)
    line_len = len(line_list)
    res = defaultdict(str)
    for head, content in zip(header,line_list):
        res[head] = content
    if header_len > line_len:
        pos_continue = line_len
        for i in range(pos_continue,header_len):
            res[header[i]]=""
    return dict(res)
