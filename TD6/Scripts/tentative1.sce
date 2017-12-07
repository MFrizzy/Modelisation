//
// Strategie aléatoire proportionnelle
// Affecte aux trois serveurs successivement
function [Q1, Q2, Q3] = aleaProp(Tmax, lambda, mu)
    Q1 = [0, 0, 0]; Q2 = Q1; Q3 = Q1; // initialisation des files
    i = 0;  // initialisation : indice de la requête courante
    ta = 0; // initialisation : instant de son arrivée
    while (ta < Tmax)
        ia = randExp(1, lambda) // tirage de l'intervalle interarrivée
        i = i+1 // une nouvelle requête
        ta = ta + ia // instant (date)de son arrivée
        nq = num_serv() // choix de la file d'affectation
        ts = randExp(1, mu(nq)) // temps de service, selon le
                                // serveur choisi
        select nq // instuction switch en scilab
        case 1 // si on affecte au serveur 1 alors ...
            Q1 = insere(Q1, ta, ts) // insertion dans la file 1
        case 2 // ainsi de suite
            Q2 = insere(Q2, ta, ts)
        else
            Q3 = insere(Q3, ta, ts)
        end
        // 
    end
    Q1 = Q1(Q1(:,1)<Tmax,:) // on rennvoie les 3 files
    Q2 = Q2(Q2(:,1)<Tmax,:) 
    Q3 = Q3(Q3(:,1)<Tmax,:) 
endfunction 

lambda= 1/3; // loi des (inter)-arrivees
mu = [1/15, 1/10, 1/6]; // loi des temps de service des trois serveurs
[Q1, Q2, Q3] = aleaProp(3600, lambda, mu); // simulation sur 1 heure
// Traces des courbes
plot2d(Q1(:,1), Q1(:,2), style= 1)
plot2d(Q2(:,1), Q2(:,2), style= 2)
plot2d(Q3(:,1), Q3(:,2), style= 3)

function nq = num_serv()
    u = rand()
    if u < 0.2 then
        nq = 1
    elseif u < 0.5
        nq = 2
    else
        nq = 3
    end
endfunction
