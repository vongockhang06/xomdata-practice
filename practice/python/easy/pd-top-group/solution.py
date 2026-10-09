# Xom Data · The city that brought in the most
# Problem: https://xomdata.com/practice/pd-top-group
# Solved: 2026-10-09

import pandas as pd


def best_city(orders):
    # Return the name of the city with the highest total amount.
    return orders.groupby('city')['amount'].sum().reset_index().sort_values(['amount','city'],ascending=[False,True]).reset_index(drop=True).loc[0,'city']
