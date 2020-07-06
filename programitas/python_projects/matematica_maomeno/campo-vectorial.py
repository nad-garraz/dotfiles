from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
import numpy as np
from numpy import sin, cos, pi, sqrt, arange, meshgrid

fig = plt.figure()
ax = fig.gca(projection='3d')

x, y, z =  meshgrid( arange(-0.5, 1, 0.2),
                       arange(-0.5, 1, 0.2),
                       arange(-0.5, 1, 0.2))

u = x
v = y
w = ( sqrt(2.0 / 3.0) *  cos( pi * x) *  cos( pi * y) * sin( pi * z))

ax.quiver(x, y, z, u, v, w, length=0.1)

plt.show()
