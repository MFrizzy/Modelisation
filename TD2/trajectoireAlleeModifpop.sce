clear;
clf;

avect = 0.5:0.1:2.5; // Vecteurs des différentes valeurs de a (population initiale)
h = 0.1; // pas de temps
r = 0.4; K = 2; A = 1; // variables globales de la formule de la vitesse d'accroissement

function f = logistique(x); // fonction qui calcule la vitesse d'accroissement
    f = r * x .*((x/A -1).* (1 - x / K)); // opérations vectorielles. x est un vecteur
endfunction

ndate = 0:h:20; // le vecteur des instants où on calcule la solution

for i= 1:21; // Boucle qui dessine les courbes
    x(1) = avect(i); // Initialisation de la population initiale 
    for n = 1:length(ndate) - 1; // Boucle qui calcul la population pour une valeur de a
        x(n+1) = x(n) + h * logistique(x(n)); // Calcul de la population
    end
    plot2d(ndate, x, style = i); // Tracé de la trajectoire.
end
