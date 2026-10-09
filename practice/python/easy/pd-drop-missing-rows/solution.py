# Xom Data · Drop rows missing required information
# Problem: https://xomdata.com/practice/pd-drop-missing-rows
# Solved: 2026-10-09

import pandas as pd


def drop_incomplete(table, required):
    # Drop rows that are empty in any of the required columns.
    return table.dropna(subset=required)
