clear 
clf 
b=0.5; d=0.3; 
Alphavect = 0.05:0.05:0.5;
ndate = 0:30;
for i = 1:10
    alpha=Alphavect(i);
    x(1) = 1; 
    for n = 1:30
        x(n+1)=x(n)+b*x(n)- (d*x(n)+alpha*x(n)*x(n));
    end
    plot2d(ndate, x, style = -1); 
    plot2d(ndate, x, style = i);
end

