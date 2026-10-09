# Xom Data · Add a month column from the order date
# Problem: https://xomdata.com/practice/pd-month-column
# Solved: 2026-10-09

import pandas as pd


def add_month(orders):
    # Add a month column shaped YYYY-MM, taken from order_date.
    df=orders.copy()
    df['month'] = pd.to_datetime(df['order_date']).dt.strftime('%Y-%m')
    return df
