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
R(i2) = R(i2)+((R(i2)^2)/2)
R(i3) = R(i3)-((R(i3)^2)/2)
R(i4) = 1;
plot2d(t,R,style=2)
legend("Fonction de répartition de la loi tente")
