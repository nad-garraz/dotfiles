from sympy import Matrix, pretty, Transpose, Symbol
from numpy import sqrt

## DEFINO LOS SIMBOLOS X Y PARA REALIZAR OPERACIONES ALGEBRAICAS
x = Symbol('x')
y = Symbol('y')


#### DEFINO A LA MATRICES QUE VOY A MULTIPLICAR
A = Matrix([
    [ 3,  7, ],
    [ 2, 5, ],

    ])

B = Matrix([
    [ 5, -7,  ],
    [ -2,    3, ],
    ])

# MULTIPLICO LAS MATRICES

C = A*B

#=================
#=================
#### PRODUCTO PARA QUE QUEDE COMO CONICA PARA GRAFICAR EN FORMA GENERAL
# conica = xy_tra*Pinv*D*P*xy
# MUESTRA LA MATRIZ xT * PT * D * P x
# print( "xT * PT * D * P * x  = \n{}".format( pretty(conica) ) )

#================
#================
# MUESTRO LOS RESULTADOS
#================
#================


# MUESTRA LA MATRIZ A y B QUE LUEGO SE MULTIPLICAN

print( "A = \n{}\n\n".format( pretty(A) ) )
print( "B = \n{}\n\n".format( pretty(B) ) )

## MUESTRA LA MATRIZ RESULTADO DE MULTIPLICAR
print( "A * B = \n{}".format( pretty(C) ) )
#=================

