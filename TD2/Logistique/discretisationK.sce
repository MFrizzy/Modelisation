clear;
clf;

a = 0.1; h = 0.1; // variables globales de population initiale et pas de temps
r=0.4; // variable globale de la formule de la vitesse

function f = logistique(x); // fonction qui calcule la vitesse d'accroissement
    f = r * x .* (1 - x / K); // opérations vectorielles. x est un vecteur
endfunction

ndate = 0:h:20; // le vecteur des instants où on calcule la solution

kvect = 1:0.1:1.6; // Vecteurs des différentes valeurs de k

x(1) = a; // Déclaration et initialisation de la population initiale

for i = 1:7; // Boucle qui dessine les courbes
    K = kvect(i); // Initialisation de K
    for n = 1:length(ndate) - 1; // Boucle qui calcul la population pour une valeur de K
        x(n+1) = x(n) + h * logistique(x(n)); // Calcul de la population
    end
    plot2d(ndate, x, style = i); // Tracé de la trajectoire
end
