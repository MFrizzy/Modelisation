clear // supprime les anciennes variables
clf // supprime la figure 
bvect = 0.4:0.1:1.4 // vecteur allant de 0 à 1,4 avec un pas de 0.2
b = 0.4; d = 0.3; alpha=0.05; // initialise le taux de natalité et de mortalité à 10 et 5%
ndate = 0:20 // initialise la durée de l'étude à 20 mois
for i = 1:11
    x(1) = 1;
    b=bvect(i);
    for n = 1:20
      x(n+1) = x(n) + b * x(n) -(d * x(n)+alpha*x(n)*x(n));
    end
    plot2d(ndate, x, style = -1) // affiche une modélisation 2D avec ndate en abscisses et x en ordonnées et des croix à la place d'un trait continu
    plot2d(ndate, x, style = i) // la couleur de chaque modélisation 2D varie en fonction de I
end



//Modèle logistique avec NATALIT2 QUI GRANDIT
