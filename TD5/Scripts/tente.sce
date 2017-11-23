// ------ Fonction de densité ----------

t = linspace(-1, 1, 301);
T = t;
i1 = (t>=-1) & (t<=1);
i2 = t>1 & t<-1;
T(i1)=1-abs(T(i1));
T(i2)=0
plot2d(t,T,style=2)
legend("Fonction de densité de la loi tente")

// ------ Fonction de répartition ----------

t = linspace(-1, 1, 301);
R=t;
i1 = t<-1;
i2 = (t>=-1) & (t<=0);
i3 = (t>0) & (t<=1);
i4 = t>1;
R(i1) = 0;
R(i2) = 0.5 + R(i2)+((R(i2)^2)/2)
R(i3) = 0.5 + R(i3)-((R(i3)^2)/2)
R(i4) = 1;
plot2d(t,R,style=2)
legend("Fonction de répartition de la loi tente")


// --------- Inverse de la fonction de répartition ---------------

t=linspace(0,1,101);
I=t;
i1=t<0.5;
i2=t>=0.5;
R(i1)=-(R(i1)^2+1)/2;
R(i2)=(R(i2)^2+1)/2;
plot2d(t,I,style=2)

function t = V(n) // forme vectorielle. Renvoie un ech de taille n.
u = rand(n, 1); // echantillon uniforme sur [0 ; 1]. Taille n
t = u // on prépare un vecteur de même taille pour l'image
i1 = u < 1/2 // indices booléens des u < 1.2
i2 = u >= 1/2 // indices booléens des u >= 1.2
t(i1) = -(t(i1)^2+1)/2 // inversion pour les u < 1/2
t(i2) = (t(i2)^2-1)/2 // inversion pour les autres
endfunction

histplot(10,V(10000))
