import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt

mpl.rcParams['lines.color'] = 'k'
mpl.rcParams['axes.prop_cycle'] = mpl.cycler('color', ['k'])
x = np.linspace(-9, 9, 400)
y = np.linspace(-5, 5, 400)
x, y = np.meshgrid(x, y)

# PARA QUE SE VEAN LOS EJES CARTESIANOS
def axes():
    plt.axhline(0, alpha=1)
    plt.axvline(0, alpha=1)

#================
#================
# CONICA EN FORMA GENERICA:  "Ax^2 + B*x*y + C*y^2 + D*x + E*y + F = 0"
#================
#================
# DEFINO LOS PARAMETROS DE LA CONICA
a, b, c, d, e, f = 0.6, -5.6, -3.6, 0, 0, -1

# PARABOLA --->   B^2 − 4*A*C=0
# ELIPSE --->   B^2 − 4*A*C<0
# HIPERBOLA  --->   B^2 − 4*A*C>0

#================
# SELECCIONO SEGUN LA CONICA A GRAFICAR
#================
# assert b**2 - 4*a*c == 0 # PARABOLA
# assert b**2 - 4*a*c < 0 # ELIPSE
assert b**2 - 4*a*c > 0 # HIPERBOLA 


#================
#================
# MUESTRO LOS RESULTADOS
#================
#================
axes()
plt.contour(x, y,(a*x**2 + b*x*y + c*y**2 + d*x + e*y + f), [0], colors='r')
plt.ylabel('y')
plt.xlabel('x')
plt.gca().set_aspect('equal', adjustable='box')
plt.grid(True)
plt.legend()
plt.show()
