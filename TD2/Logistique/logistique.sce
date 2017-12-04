clear;
clf;

r = 0.4; K = 2; // variables globales 
x = linspace(0, 3, 301); // vecteur qui va dessiner la courbe
y = r * x.* (1 - x / K); // calcul des valeurs de la vitesse de variation
z=x.*0; // vecteur de valeurs 0 (faire apparaitre l'axe des abscisses)

plot2d(x, y, style = 2); // dessine de la courbe
plot2d(x,z,style=1); // dessine l'axe des abscisses
