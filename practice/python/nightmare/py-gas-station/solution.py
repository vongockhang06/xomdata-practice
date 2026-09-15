# Xom Data · Gas station
# Problem: https://xomdata.com/practice/py-gas-station
# Solved: 2026-09-15

def can_complete(gas: list[int], cost: list[int]) -> int:
    if sum(gas) < sum(cost):
        return -1
    start_index = 0
    current_gas = 0
    for i in range(len(gas)):
        current_gas += gas[i] - cost[i]
        if current_gas < 0:
            start_index = i + 1
            current_gas = 0

    return start_index
