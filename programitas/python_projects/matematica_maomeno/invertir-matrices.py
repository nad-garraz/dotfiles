from sympy import Matrix, pretty
from numpy import sqrt


# DEFINO A LA MATRIZ A
A = Matrix([
    [ 3/4, -1/2, ],
    [-1/3, 5/6],
    ])

# INVIERTO LA MATRIZ A
A_INV = A.inv()

# CORROBORACION
IDENTIDAD = A * A_INV

#============================
#============================
# MUESTRA DE RESULTADOS
#============================
#============================


# MUESTRA LA MATRIZ A
print("A = \n{}\n\n".format(pretty(A)))

# MUESTRA LA INVERSA DE LA MATRIZ A
print( "A^(-1) = \n{}\n\n".format( pretty(A_INV) ) )

# ESTO DEBERIA SER LA IDENTIDAD
print( "A * A^(-1) =\n{}".format(pretty( IDENTIDAD )) )
