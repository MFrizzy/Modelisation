clear;
clf;

r = 0.4; K1 = 2; K = 2; A = 1; // Variables globales des 2 modèles
x = linspace(0, 3, 301); // Vecteur qui permet le calcul des 2 vitesses d'accroissements

y = r * x.* (1 - x / K1); // Calcul de la vitesse d'accroissement

courbeAllee= r * x.* ((x/A -1).*(1 - x/K)); // Calcul de la vitesse d'accroissement

z=x.*0; // Vecteur dessinant l'axe des abscisses

plot2d(x, y, style = 2); // Tracé de la vitesse d'accroissement pour le modèle logistique
plot2d(x,courbeAllee,style=2); // Tracé de la vitesse d'accroisement pour le modèle logistique avec l'effet Allee
plot2d(x,z,style=1); // Tracé de l'axe des abscisses

x1=(K+A-sqrt(K-A^2-K*A))/3;

zz=(r*x1*(x1/A-1)*(1-x1/K));

vec=linspace(1,1,301);

zzz=vec.*-0.07407407407407407;
plot2d(x,zzz,style=1);
