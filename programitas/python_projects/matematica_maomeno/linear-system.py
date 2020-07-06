from sympy import Matrix, Transpose, pretty, linsolve, symbols
from sympy.solvers import solve


# DEFINO PRIMERO LAS INCOGNITAS A ENCONTRAR
x, y, z = symbols("x y z")
# x, y, z ,u = symbols("x y z u ")

# MATRIZ CON COEFICIENTES DEL SISTEMA
A = Matrix([
    [ 1, 3, -1,  ],
    [ 2, 0, 1,],
    [ 3, -3, 3,],
    ])

# TERMINOS INDEPENDIENTES
b = Matrix([
    [ 1, ],
    [ 0, ],
    [ 1, ],
    ])

# DEFINO EL SISTEMA A RESOLVER
system = A, b

# RESUELVO PARA X Y Z SEGUN CANTIDAD DE VARIABLES
solution = linsolve(system, x, y, z)
# solution = linsolve(system, x, y, z, u)

#==========================
#==========================
# MUESTRO LOS RESULTADOS
#==========================
#==========================
print( "A=\n{}".format(pretty( A )) )
print( "b=\n{}".format(pretty( b )) )
print( "A x = b --> x =\n{}".format(pretty( solution )) )
