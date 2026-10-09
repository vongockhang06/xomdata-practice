# Xom Data · Turn status codes into words people read
# Problem: https://xomdata.com/practice/pd-map-labels
# Solved: 2026-10-09

import pandas as pd


def label_status(orders, labels):
    # Add a status_label column translated from the status codes.
    df = orders.copy()
    df['status_label'] = df['status'].map(labels)
    return df
