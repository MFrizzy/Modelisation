clear;
clf;

a = 0.1; h = 0.1; // variables globales de population initiale et pas de temps
K=2; // variable globale de la formule de la vitesse

function f = logistique(x); // fonction qui calcule la vitesse d'accroissement
    f = r * x .* (1 - x / K); // opérations vectorielles. x est un vecteur
endfunction

ndate = 0:h:40; // le vecteur des instants où on calcule la solution

rvect = linspace(0, 1, 11); // Vecteurs des différentes valeurs de r

x(1) = a; // Déclaration et initialisation de la population initiale

for i = 1:6; // Boucle qui dessine les courbes
    r = rvect(i); // Initialisation de r
    for n = 1:length(ndate) - 1; // Boucle qui calcul la population pour une valeur de r
        x(n+1) = x(n) + h * logistique(x(n)); // Calcul de la population
    end
    plot2d(ndate, x, style = i); // Tracé de la trajectoire
end
