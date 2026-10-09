# Xom Data · Add the line total to each order
# Problem: https://xomdata.com/practice/pd-revenue-column
# Solved: 2026-10-09

import pandas as pd


def add_revenue(orders):
    # Return a copy with a revenue column; leave the input table untouched.
    df=orders.copy()
    df['revenue']=df['quantity']*df['unit_price']
    return df
