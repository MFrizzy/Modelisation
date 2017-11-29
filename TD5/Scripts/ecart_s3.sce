load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')

// Extraction des temps de service
index_bool = ( data(:, 3) == 3 )
tabS1 = data(index_bool, :)
t_s1 = tabS1(1:$,4);

function q = quantile(l,p)
    q = -log(1-p)/l
endfunction

lambda=1/mean(t_s1);

n = 10;
C = zeros(1, n + 1)
C(1) = 0; C(n+1) = 10000; 
for i = 1:(n-1)
    C(i+1) = quantile(lambda,i/n);
end
format(6)

Ei = 413 / n // effectif espéré dans chaque classe

Oi = histc(C, t_s1, normalization = %f);
d = sum((Oi - Ei) .^2 ./ Ei);
