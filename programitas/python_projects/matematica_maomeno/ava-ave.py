from sympy import Matrix, pretty
from sympy import *
import numpy as np

# DEFINO A LA MATRIZ
L = Matrix([
    [1/2, 1, -1,],
    [ 0, 1, -1, ],
    [ 0, 0, 1, ],
    ])


## L = L.inv()

if  L.is_diagonalizable() == False :
    print("La matriz no es diagonalizable: ")
    print("El resultado muestra AVA, MULTIPLICIDAD, AVE: ")
    print(pretty( L.eigenvects()) )

else:
    # ME DEVUELVE A LA MATRIZ DE AUTOVECTORES C Y LA MATRIZ DE AUTOCALORES D 
    [C,D] = L.diagonalize()


    # COMPROBACION
    L = C*D*C**-1


    # MUESTRA LA MATRIZ L
    print("L = \n{}\n\n".format(pretty(L)))

    print
    # MUESTRA LOS AUTOVECTORES CON SUS AUTOVALORES Y MULTIPLICIDAD
    print("La matriz es diagonalizable: ")
    print("El resultado muestra AVA, MULTIPLICIDAD, AVE: ")
    print(pretty(L.eigenvects(), num_columns=132))

    # MUESTRA LA MATRIZ DE AUTOVECTORES
    print( "C = \n{}\n".format( pretty( C ) ))
    # MUESTRA LA MATRIZ DE AUTOVALORES
    print( "D = \n{}\n".format( pretty( D ) ))
    # MUESTRA LA MATRIZ DE AUTOVECTORES
    print( "C-1 = \n{}\n".format( pretty( C**-1 ) ))

    # VERIFICA QUE TODO DE BIEN
    print("C*D*C**-1 == L ==> {}".format(C*D*C**-1 == L))

