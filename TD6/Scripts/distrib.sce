clf
subplot(1,2,1)
Q60 = zeros(500, 1); // prépare la place pour l'échantillon
for i=1:500 // 500 trajectoires
    Q = queue(60, 1/2, 1/2); // mu est plus grand que lambda
    Q60(i) = Q($, 2); // on ne garde que la taille à la fin
end
distr60 = tabul(Q60, 'i') // examen de la distribution de q(60)
bar(distr60(:,1), distr60(:,2)/500) // tracé du diagramme
subplot(1,2,2)
histplot(10,Q60)
//legend("Distribution de Q60")


// Q120

subplot(1,2,2)
Q120 = zeros(500, 1); // prépare la place pour l'échantillon
for i=1:500 // 500 trajectoires
    Q = queue(2000, 1/2, 1/2); // mu est plus grand que lambda
    Q120(i) = Q($, 2); // on ne garde que la taille à la fin
end
distr120 = tabul(Q120,'i')
bar(distr120(:,1),distr120(:,2)/500)
//histplot(distr120(:,1),distr120(:,2)/500)
a=2000
legend("Distribution de Q"+string(a))



function Qi=distrib(n,lambda,mu)
    Qi = zeros(500, 1);
    for i=1:500
        Q = queue(n, lambda, mu);
        Qi(i) = Q($, 2);
    end
    distr = tabul(Qi,'i')
    bar(distr(:,1),distr(:,2)/500)
    legend("Distribution de Q"+string(n))
endfunction

function Qi=distribv2(n,lambda,mu)
    Qi = zeros(500, 1);
    for i=1:500
        Q = queue(n, lambda, mu);
        Qi(i) = Q($, 2);
    end
    histplot(20,Qi)
    legend("Distribution de Q"+string(n))
endfunction

clf

mu=0.2
lambda=0.5
subplot(1,2,1)
Q60=distrib(60,lambda,mu)
subplot(1,2,2)
Q120=distrib(120,lambda,mu)

mean(Q60)
mean(Q120)
