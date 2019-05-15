
import numpy as np

def entropy(p):
    return -np.sum(np.log(p) * p)

def xe(p, q):
    return -np.sum(np.log(q) * p)

def KL(p, q):
    return entropy(p) - xe(p, q)


islands = [
    np.array([ 0.2 , 0.2 , 0.2 , 0.2 , 0.2 ]),
    np.array([ 0.8 , 0.1 , 0.05 , 0.025 , 0.025 ]),
    np.array( 0.05 , 0.15 , 0.7 , 0.05 , 0.05 )
]

print([(i, entropy(isl)) for i, isl in enumerate(islands)])


# generates all pairs of indices for us
from itertools import permutations

for i, j in permutations(range(0, len(islands)), 2):
    print(f"p = Island {i}, q = Island {j}, KL = {KL(islands[i], islands[j])}")

