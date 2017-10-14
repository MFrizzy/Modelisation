clear
clf

avect=0.5:0.1:1.5;
r = 0.25 ; K = 2 ; I=0.1 ; A = 0.5 ;// paramètres du modèle
h = 0.05;
ndate = 0:h:20;

function f = allee(x)
    f = r * x .* (x / A - 1 ) .* (1 - x / K)+I
endfunction

for i=1:11;
    x(1)=avect(i);
    for n = 1:length(ndate) - 1
        x(n+1) = x(n) + h * allee(x(n));
    end 
    plot2d(ndate, x, style = i)
    a=gca();
    a.x_location = "origin";
    a.grid=[5,5];
end
