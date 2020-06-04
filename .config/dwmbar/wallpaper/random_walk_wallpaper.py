import matplotlib.pyplot as plt
import os

from random_walk import RandomWalk

# Donde guardar el archivo
filename="/home/test/.config/dwmbar/wallpaper/wall.png"

# Para poder sobreescribir el archivo en caso
# de que ya exista.
if os.path.isfile(filename):
   os.remove(filename)

# Make a random walk, and plot the points.
rw = RandomWalk()
rw.fill_walk()

# Set the size of the plotting window and
# create the subplot so I can later change the
# bgcolor. El tamaño de la imagen es tricky,
# poniendo esos valores queda algo manejable.

fig = plt.figure(figsize=(1920/96*1.29, 1080/96*1.29), dpi=96)
ax = fig.add_subplot(1, 1, 1)

# Graficar el camino
plt.plot(rw.x_values, rw.y_values, linewidth=0.1, color="#ffffff")

# Emphasize the first and last points.
plt.scatter(0, 0, c='white', edgecolors='none', s=10)
plt.scatter(rw.x_values[-1], rw.y_values[-1], c='white', edgecolors='none', s=15)

# Saco los ejes de la figura
ax.get_xaxis().set_visible(False)
ax.get_yaxis().set_visible(False)

# Color del fondo de la imagen
ax.set_facecolor('#000000')

# Guardar la imagen en "filename"
plt.savefig(filename, bbox_inches='tight', pad_inches = 0)
