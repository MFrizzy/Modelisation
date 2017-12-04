clear;
clf;

a = 1; h = 0.1; // variables globales de population initiale et pas de temps
r=0.4; K=2; // variables globales de la formule de la vitesse d'accroissement

Avect= 0.5:0.1:1.5; // Vecteur des différentes valeurs de A

function f = logistique(x); // fonction qui calcule la vitesse d'accroissement
    f = r * x .*((x/A -1).* (1 - x / K)) + I; // opérations vectorielles. x est un vecteur
endfunction

ndate = 0:h:20; // le vecteur des instants où on calcule la solution

x(1) = a; // Déclaration et initialisation de la population initiale

I = 0.1;

for i=1:11 // Boucle qui dessine les courbes
    A=Avect(i); // Initialisation de la valeur de A
    for n = 1:length(ndate) - 1; // Boucle qui calcul la population pour une valeur de A
        x(n+1) = x(n) + h * logistique(x(n)); // Calcul de la population
    end
    plot2d(ndate, x, style = i); //Tracé de la trajectoire.
end
