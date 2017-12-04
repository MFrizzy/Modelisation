clear 
clf 
b=0.5; d=0.3; 
ndate = 0:30
alpha = 0.05;
x(1) = 1;
for n=1:30
    x(n+1)=x(n)+b*x(n)- (d*x(n)+alpha*x(n)*x(n));
end
plot2d(ndate, x, style = -1) 
plot2d(ndate, x, style = 2)
r=1.2; C=0.05; 
ndate = 0:30;
x(1) = 1;
for n=1:30
    x(n+1)=r*(x(n)/(C*x(n)+1));
end
plot2d(ndate, x, style = -1) 
plot2d(ndate, x, style = 3)
