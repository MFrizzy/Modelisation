clear 
clf 
r=1.2; C=0.05; 
Avect = 0:1:10;
ndate = 0:30;
for i = 1:10
    x(1) = Avect(i); 
    for n = 1:30
        x(n+1)=r*(x(n)/(C*x(n)+1));
    end
    plot2d(ndate, x, style = -1); 
    plot2d(ndate, x, style = i);
end

