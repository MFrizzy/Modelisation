clear 
clf 
r=1.05; C=0.05; 
ndate = 0:30;
x(1) = 1;
for n=1:30
    x(n+1)=r*(x(n)/(C*x(n)+1));
end
plot2d(ndate, x, style = -1) 
plot2d(ndate, x, style = 2)
