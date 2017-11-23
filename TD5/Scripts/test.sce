
rand("seed", 123456789) // on fixe le germe
rand(10,1) // 10 réalisation U([0,1])
rand(10,1) // ces dix suivantes sont différentes
rand("seed", 123456789) // on reprend le même germe
rand(10,1) // et on retrouve la première séquence


data = rand(10000, 1); // un échantillon de taille 10 000 (c'est beaucoup)
histplot(20,data); // tracé de l'histogramme avec 20 classes


a = -3; b = 5; // on veut U(]-3 ; 5[)
histplot(20, a + (b - a) * rand(10000,1)); // tracé de l'histogramme



// -----------

function tirage = bernoulli(p)
    if rand() < p then // arrive avec proba p
        tirage = 1 // c'est un succès!
    else // avec proba 1 - p
        tirage = 0 // échec
    end
endfunction

n = 1000;p = 1/4; // nb tirages, et proba de succès
x = zeros(n) // préparation du vecteur résultat
for i = 1:n // n tirages de Bernoulli
    x(i) = bernoulli(p); // supprimer affichage
end
sum(x) / n // renvoie à peu près p pour vérifier

function tirage = binomiale(n, p)
    tirage = 0
    for i = 1:n
        tirage = tirage + bernoulli(p)
    end
endfunction

// ------------------

x = linspace(-1, 1, 201); // On coupe l'intervalle [-1;1] en 200 segments
y = abs(x); // on calcule la densité en ces points
plot2d(x, y, style = 2); // on affiche le résultat en bleu


t = linspace(-1, 1, 301); // On coupe l'intervalle [-1.5;1.5] en 300
F = t; // on prépare un tableau pour les images
i1 = (t >= -1) & (t < 0) // indices booléens pour -1 <= t < 0
i2 = t >= 0 & t < 1 // indices booléens pour 0 <= t < 1
F(i1) = (1 - t(i1).^2 ) / 2
F(i2) = (1 + t(i2).^2 ) / 2
plot2d(t, F, style = 2); // on affiche le résultat en bleu

function t = V(n) // forme vectorielle. Renvoie un ech de taille n.
u = rand(n, 1); // echantillon uniforme sur [0 ; 1]. Taille n
t = u // on prépare un vecteur de même taille pour l'image
i1 = u < 1/2 // indices booléens des u < 1.2
i2 = u >= 1/2 // indices booléens des u >= 1.2
t(i1) = -sqrt(1 - 2 * u(i1)) // inversion pour les u < 1/2
t(i2) = sqrt(2 * u(i2) - 1) // inversion pour les autres
endfunction

histplot(10,V(10000))


//----------------------------------- Tentative de faire une fonction inverse




t = linspace(-1, 1, 301);
T = t;
i3 = (t>=-1) & (t<=1);
i4 = (t>1) & t(<-1);
T(i3)=1-abs(T(i3));
T(i4)=0
plot2d(t,T)
legend("Fonction de densité de la loi tente")
