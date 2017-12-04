clear
clf
b = 0.1; d = 0.05 ; x(1) = 1;
r = b - d;
h = 1;
ndate = 0:20
for n = 1:20
x(n+1) = (1 + r ) * x(n);
end
plot2d(ndate, x, style = 2, rect=[0,0,20, 3])
