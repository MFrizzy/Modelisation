clear
clf

// Choix des paramètres :
r = 0.5; A = 0.5; K = 2;

Ivect=0:0.1:1;

for i=1:11;

    function f = allee_imig(x)
        f = r * x .* (x / A - 1 ) .* (1 - x / K)+ I
    endfunction

    I=Ivect(i);

    // Découpage de l'intervalle [0 ; 2.2]
    x = linspace(0, 2.2, 301);
    plot2d(x, allee_imig(x), style = i) 
    a=gca();
    a.x_location = "origin";
    a.grid=[5,5];

end
