# Xom Data · Pick the data files out of a download folder
# Problem: https://xomdata.com/practice/py-csv-files-only
# Solved: 2026-08-15

def csv_files(names):
    return [x for x in names if x[-4:]=='.csv']
