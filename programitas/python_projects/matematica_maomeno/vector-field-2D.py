import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(-3,10,1)
y = np.linspace(-3,11,1)
(X,Y) = np.meshgrid(x,y)
u = x
v = y
q = plt.quiver(X,Y,u,v,angles='xy',scale=1000,color='r')
p = plt.quiverkey(q,1,16.5,50,"50 m/s",coordinates='data',color='r')
xl = plt.xlabel("x (km)")
yl = plt.ylabel("y (km)")
plt.show()
