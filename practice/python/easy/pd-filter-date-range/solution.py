# Xom Data · Orders within a date range
# Problem: https://xomdata.com/practice/pd-filter-date-range
# Solved: 2026-10-09

import pandas as pd


def orders_between(orders, start, end):
    # Keep the orders dated between start and end, both ends included.
    start = pd.to_datetime(start)
    end = pd.to_datetime(end)
    temp=pd.to_datetime(orders['order_date'])
    return orders[temp.between(start,end)]
