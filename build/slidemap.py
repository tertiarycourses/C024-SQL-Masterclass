"""Old (WSQ v14, 0-based) -> new (C024 v1) slide order: drops + lunch moved after Lab 4 verify."""
DROPPED = {2, 7, 11, 12, 13, 15, 16, 17, 53, 102, 128, 129, 130}
LUNCH, LAB4_VERIFY = 80, 72
order = [i for i in range(132) if i not in DROPPED and i != LUNCH]
order.insert(order.index(LAB4_VERIFY) + 1, LUNCH)
assert len(order) == 119


def remap(n1):
    """1-based old slide number -> 1-based new number (dropped -> nearest previous kept)."""
    i = n1 - 1
    while i not in order:
        i -= 1
    return order.index(i) + 1
