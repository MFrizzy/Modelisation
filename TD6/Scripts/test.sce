function a=queue(Tmax, lambda, mu)
    Q = [0, 0, 0]; // Initialisation de la file
    t = 0; // temps courant
    while (t < Tmax)
        t_ia=randExp(1,lambda); // tirage de l'intervalle inter-arrivée
        t=t+t_ia;// mise à jour de l'instannt courant : instant d'arrivée de la prochaine requête
        ts=randExp(1,mu); // tirage de son temps de service
        Q=insere(Q,t,ts);// insertion dans la file des évènements
    end
    a = Q (Q(:,1)<Tmax,:) // on renvoie l'état de la file à la date Tmax
endfunction

for i=1:50 // 50 trajectoires
    Q = queue(60, 1/2, 1/10); // lambda est 5 fois plus grand que mu
    plot2d2(Q(:,1), max(Q(:,2) - 1, 0), style=2) // trace la courbe
end

