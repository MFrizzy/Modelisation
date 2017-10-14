clear
clf

Ivect=0:0.1:1;
r = 0.5; A = 0.5; K = 2; // paramètres du modèle
h = 0.05;
// pas de temps
ndate = 0:h:20;
a = 0.6;
// condition initiale
//
// Discrétisation de l'équation differentielle


function f = allee(x)
f = r * x .* (x / A - 1 ) .* (1 - x / K)+I
endfunction
//


x(1)=a;
for i=1:11;
I=Ivect(i);
for n = 1:length(ndate) - 1
x(n+1) = x(n) + h * allee(x(n));
end 
plot2d(ndate, x, style = i)
a=gca();
a.x_location = "origin";
a.grid=[5,5];
end
