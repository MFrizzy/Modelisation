clear;
clf;

r = 1; K1 = 2; K = 2; A = 0.5; // Variables globales des 2 modèles
x = linspace(0, 3, 301); // Vecteur qui permet le calcul des 2 vitesses d'accroissements
I=0.1;
y = r * x.* (1 - x / K1); // Calcul de la vitesse d'accroissement

courbeAllee= r * x.* ((x/A -1).*(1 - x/K))+I; // Calcul de la vitesse d'accroissement

z=x.*0; // Vecteur dessinant l'axe des abscisses

//plot2d(x, y, style = 2); // Tracé de la vitesse d'accroissement pour le modèle logistique
plot2d(x,courbeAllee,style=2); // Tracé de la vitesse d'accroisement pour le modèle logistique avec l'effet Allee
plot2d(x,z,style=1); // Tracé de l'axe des abscisses
