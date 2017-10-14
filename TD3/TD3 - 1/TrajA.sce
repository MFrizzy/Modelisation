clear
clf

Avect=0.5:0.1:1.5;
r = 1 ; K = 2 ; I=0.1 ; // paramètres du modèle
h = 0.05;
// pas de temps
ndate = 0:h:20;
a = 0.7;

function f = allee(x)
    f = r * x .* (x / A - 1 ) .* (1 - x / K)+I
endfunction
//


x(1)=a;
for i=1:11;
    A=Avect(i);
    for n = 1:length(ndate) - 1
        x(n+1) = x(n) + h * allee(x(n));
    end 
    plot2d(ndate, x, style = i)
    a=gca();
    a.x_location = "origin";
    a.grid=[5,5];
end
