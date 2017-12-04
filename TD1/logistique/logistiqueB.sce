clear 
clf 
d=0.3;  
bvect = 0.1 : 0.05 : 0.55;
ndate = 0:30;
alpha = 0.05;  
for i = 1:10
    b=bvect(i);
    x(1) = 1; 
    for n = 1:30
        x(n+1)=x(n)+b*x(n)- (d*x(n)+alpha*x(n)*x(n));
    end
    plot2d(ndate, x, style = -1);
    plot2d(ndate, x, style = i);
end

