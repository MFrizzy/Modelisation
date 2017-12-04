clear;
clf;

K = 2; // valeur globale
x = linspace(0, 3, 301); // vecteur qui va contenir la vitesse d'accroissement

function f = logistique(x); // fonction qui calcule la vitesse d'accroissement
    f = r * x .* (1 - x / K); // opérations vectorielles. x est un vecteur
endfunction

rvect = linspace(0, 1, 11); // Vecteur contenant les différentes valeurs de r

for i = 1:11 // Boucle qui va dessiner les différentes courbes
    r = rvect(i); // On fixe la valeur de r 
    plot2d(x, logistique(x), style = i); // On trace la courbe après calcul
end
