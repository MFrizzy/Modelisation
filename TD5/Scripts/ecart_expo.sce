// a) calcul de k classes

function q = quantile(l,p)
    q = -log(1-p)/l
endfunction

function t = expo(l,n)
    u = rand(n, 1);
    t = u
    t = -log(1-t)/l
endfunction

lambda=1;

n = 10;
C = zeros(1, n + 1)
C(1) = 0; C(n+1) = 1000000000000; 
for i = 1:(n-1)
    C(i+1) = quantile(lambda,i/n);
end
format(6)

Ei = 3000 / n // effectif espéré dans chaque classe

N = 10000
d = zeros(1, N);
for i = 1:N
    Oi = histc(C, expo(lambda,3000), normalization = %f);
    d(i) = sum((Oi - Ei) .^2 ./ Ei);
end

histplot(20,d)
legend("10 000 réalisations de la mesure d écart")

seuil=perctl(d,95)



aa=a(1)
b=d<aa

histplot(10, d(b))

