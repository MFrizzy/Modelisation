clear;
clf;

r = 0.4; // valeur globale
x = linspace(0, 2, 201); // vecteur qui va contenir la vitesse d'accroissement

function f = logistique(x); // fonction qui calcule la vitesse d'accroissement
    f = r * x .* (1 - x / K); // opérations vectorielles. x est un vecteur
endfunction

kvect = 1:0.1:1.6; // Vecteur contenant les différentes valeurs de k

for i = 1:7 // Boucle qui va dessiner les différentes courbes
    K = kvect(i); // on fixe la valeur de r
    plot2d(x, logistique(x), style = i); // on trace la courbe après calcul
end

z=x.*0; // Calcul du vecteur de 0
plot2d(x,z,style=1); // Tracé de l'axe des abscisses
