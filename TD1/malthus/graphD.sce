clear 
clf 
dvect = 0.1:0.05:0.3;
b=0.2; d=0.05; 
ndate = 0:20;
for i = 1:11 
    x(1) = 1; 
    d=dvect(i);
    for n=1:20 
        x(n+1)=x(n)+b*x(n)-d*x(n);
    end
    plot2d(ndate, x, style = -1); 
    plot2d(ndate, x, style = i);
end
