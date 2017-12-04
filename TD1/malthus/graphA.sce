clear // supprime les anciennes variables
clf // supprime la figure
avect = 0:0.2:2; // vecteur allant de 0 à 2 avec un pas de 0.2
b=0.1; d=0.05; // déclaration de variables b et d
ndate = 0:20; // vecteur allant de 0 à 20
for i = 1:11 // boucle qui va dessiner les variables
    x(1) = avect(i); // initialise la première valeur du vecteur x avec la variable avect
    for n=1:20 // boucle qui calcule les valeurs du vecteur x
        x(n+1)=x(n)+b*x(n)-d*x(n); // calcule la valeur de x(n+1)
    end
    plot2d(ndate, x, style = -1); // dessine graph
    plot2d(ndate, x, style = i;)
end
