# Xom Data · Turn the raw table into something you can send
# Problem: https://xomdata.com/practice/pd-report-table
# Solved: 2026-10-09

import pandas as pd


def report_table(raw):
    # Keep city and revenue, rename them, sort by revenue, renumber the rows.
    return raw.sort_values(['rev','cty'],ascending=[False,True])[['cty','rev']].rename(columns={'rev':'revenue','cty':'city'}).reset_index(drop=True)
