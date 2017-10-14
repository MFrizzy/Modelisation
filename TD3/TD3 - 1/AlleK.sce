clear
clf

// Choix des paramètres :
r = 1 ; A = 0.8 ; I=0.05;

Kvect=1.5:0.1:2.5;

for i=1:11;

    function f = allee_imig(x)
        f = r * x .* (x / A - 1 ) .* (1 - x / K)+ I
    endfunction

    K=Kvect(i);

    // Découpage de l'intervalle [0 ; 2.2]
    x = linspace(0, 2.2, 301);
    plot2d(x, allee_imig(x), style = i) 
    a=gca();
    a.x_location = "origin";
    a.grid=[5,5];

end
