clear
clf
b = 0.1; d = 0.05 ;
r = b - d;
xj(1) = 1;
h = 1 / 30;
ndate_j = 0:h:20; 
for n = 1:length(ndate_j) - 1
    xj(n+1) = (1 + r * h) * xj(n);
end
//plot2d(ndate_j, xj, style = 3);


xh(1) = 1; // Condition initiale du modèle en jours
h = 1 / (30 * 24); // Le pas de temps est l'heure
ndate_h = 0:h:20; // vecteur des dates
for n = 1:length(ndate_h) - 1
    xh(n+1) = (1 + r * h) * xh(n);
end
plot2d(ndate_h, xh, style = 4) 


b = 0.1; d = 0.05 ; x(1) = 1;
r = b - d;
h = 1;
ndate = 0:20
for n = 1:20
    x(n+1) = (1 + r ) * x(n);
end
plot2d(ndate, x, style = 2, rect=[0,0,20, 3])
