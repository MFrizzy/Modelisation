load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')

// Extraction des temps inter-arrivées
t_ia = data(2:$, 2) - data(1:1237, 2);

function q = quantile(l,p)
    q = -log(1-p)/l
endfunction

lambda=1/mean(t_ia);

n = 10;
C = zeros(1, n + 1)
C(1) = 0; C(n+1) = 100; 
for i = 1:(n-1)
    C(i+1) = quantile(lambda,i/n);
end
format(6)

Ei = 1237 / n // effectif espéré dans chaque classe

Oi = histc(C, t_ia, normalization = %f);
d = sum((Oi - Ei) .^2 ./ Ei);
