//
// Strategie circulaire
// Affecte aux trois serveurs successivement
function [Q1, Q2, Q3] = circul(Tmax, lambda, mu)
    Q1 = [0, 0, 0]; Q2 = Q1; Q3 = Q1; // initialisation des files
    i = 0;  // initialisation : indice de la requête courante
    ta = 0; // initialisation : instant de son arrivée
    while (ta < Tmax)
        ia = randExp(1, lambda) // tirage de l'intervalle interarrivée
        i = i+1 // une nouvelle requête
        ta = ta + ia // instant (date)de son arrivée
        nq = modulo(i, 3) + 1 // choix de la file d'affectation
        ts = randExp(1, mu(nq)) // temps de service, selon le
                                // serveur choisi
        select nq // instuction switch en scilab
        case 1 // si on affecte au serveur 1 alors ...
            Q1 = insere(Q1, ta, ts) // insertion dans la file 1
        case 2 // ainsi de suite
            Q2 = insere(Q2, ta, ts)
        else
            Q3 = insere(Q3, t, ts)
        end
        // 
    end
    Q1 = Q1(Q1(:,1)<Tmax,:) // on rennvoie les 3 files
    Q2 = Q2(Q2(:,1)<Tmax,:) 
    Q3 = Q3(Q3(:,1)<Tmax,:) 
endfunction 
