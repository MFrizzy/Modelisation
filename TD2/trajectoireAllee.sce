clear;
clf;

a = 0.2; h = 0.05; // variables globales de population initiale et pas de temps
r=1; K=2; A=0.5; // variables globales de la formule de la vitesse d'accroissement
I=0.1;
function f = logistique(x); // fonction qui calcule la vitesse d'accroissement
    f = r * x .*((x/A -1).* (1 - x / K))+I; // opérations vectorielles. x est un vecteur
endfunction

ndate = 0:h:20; // le vecteur des instants où on calcule la solution

x(1) = a; // Déclaration et initialisation de la population initiale

for n = 1:length(ndate) - 1; // Boucle du calcul de la population pour la courbe
    x(n+1) = x(n) + h * logistique(x(n));  // Calcul de la trajectoire pour chaque instant
end

plot2d(ndate, x, style = 2); // Tracé de la trajectoire.
