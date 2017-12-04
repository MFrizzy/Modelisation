clear 
clf 
C=0.05; 
rvect = 0.95:0.05:1.4;
ndate = 0:30;
for i = 1:10
    r=rvect(i);
    x(1) = 1; 
    for n = 1:30
        x(n+1)=r*(x(n)/(C*x(n)+1));
    end
    plot2d(ndate, x, style = -1); 
    plot2d(ndate, x, style = i);
end

