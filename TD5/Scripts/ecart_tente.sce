// a) calcul de k classes

function q = quantile(p)
    if p < 0.5 then
        q = sqrt(2*p)-1;
    else
        q = 1-sqrt(2-2*p)
    end
endfunction

function t = tente(n)
    u = rand(n, 1);
    t = u
    i1 = u < 1/2
    i2 = u >= 1/2
    t(i1) = sqrt(2*t(i1))-1;
    t(i2) = 1-sqrt(2-2*t(i2));
endfunction

n = 10;
C = zeros(1, n + 1)
C(1) = -1; C(n+1) = 1; 
for i = 1:(n-1)
    C(i+1) = quantile(i/n);
end
format(6)

Ei = 3000 / n // effectif espéré dans chaque classe

N = 10000
d = zeros(1, N);
for i = 1:N
    Oi = histc(C, tente(3000), normalization = %f);
    // calcul de la différence et stockage dans le tableau d
    d(i) = sum((Oi - Ei) .^2 ./ Ei); 
end

histplot(20,d)
legend("10 000 réalisations de la mesure d écart")

seuil=perctl(d,95)






aa=a(1)
b=d<aa

histplot(10, d(b))

