from sympy import Matrix, pretty, Transpose
from numpy import sqrt
from mpmath import mp

A = mp.matrix([
    [3/sqrt(2), 3/sqrt(2), 0, 0, ],
    [0, 0, 1/2, 1/2, ],
    [0, 0, 1/2, 1/2, ],
    ])
U,S,V = mp.svd_r(A)


print("U = \n{}\n\n".format(pretty(U)))
print("sigma = \n{}\n\n".format(pretty(S)))
print("VT = \n{}\n\n".format(pretty(V)))
