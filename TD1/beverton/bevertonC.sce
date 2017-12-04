clear 
clf 
r=1.2;
Cvect = 0.02:0.01:0.11;
ndate = 0:30;
for i = 1:10
    C=Cvect(i);
    x(1) = 1; 
    for n = 1:30
        x(n+1)=r*(x(n)/(C*x(n)+1));
    end
    plot2d(ndate, x, style = -1); 
    plot2d(ndate, x, style = i);
end

