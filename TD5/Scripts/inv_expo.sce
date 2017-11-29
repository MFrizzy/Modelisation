function t = expo(l,n)
    u = rand(n, 1);
    t = u
    t = -log(1-t)/l
endfunction
histplot(20,expo(1,100000))

a=0:0.01:12;
lambda=1;
b=lambda*exp(-lambda*a);
plot2d2(a,b,style=1)

legend("Simulation de la loi exponentielle","Densité de la loi exponentielle")
