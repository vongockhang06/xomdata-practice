# Xom Data · The best-selling products
# Problem: https://xomdata.com/practice/pd-sort-top-n
# Solved: 2026-10-09

import pandas as pd


def top_products(products, n):
    # Return the n best-selling products, ties broken by name (A to Z).
    # Renumber the rows from 0.
    return products.sort_values(['sold','name'],ascending=[False,True]).head(n).reset_index(drop=True)
