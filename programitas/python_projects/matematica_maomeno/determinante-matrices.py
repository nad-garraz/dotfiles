from sympy import Matrix, pretty
from numpy import sqrt


# DEFINO A LA MATRIZ A
A = Matrix([
    [ 3/4, -1/2,   ],
    [ -1/3, 5/6,   ],
    ])

# INVIERTO LA MATRIZ A
det = A.det()

#============================
# MUESTRA DE RESULTADOS
#============================


# MUESTRA LA MATRIZ A
print("A = \n{}\n\n".format( pretty(A)) )

# MUESTRA EL DETERMINANTE
print( "det(A) = {}\n".format( pretty(det) ) )

