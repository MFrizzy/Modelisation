function t = V(n)
    u = rand(n, 1);
    t = u
    i1 = u < 1/2
    i2 = u >= 1/2
    t(i1) = sqrt(2*t(i1))-1;
    t(i2) = 1-sqrt(2-2*t(i2));
endfunction
tente=V(10000)
histplot(20,tente)

t = linspace(-1, 1, 301);
T = t;
i1 = (t>=-1) & (t<=1);
i2 = t>1 & t<-1;
T(i1)=1-abs(T(i1));
T(i2)=0
plot2d(t,T,style=1)

legend("Fonction de densité de la loi tente","Simulation de la loi tente");
