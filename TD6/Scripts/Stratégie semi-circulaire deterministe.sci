clf;

function newq = insere(q, ta, ts)
    //
    // Inscription de l'arrivée d'une requête
    //dans la file q,
    //au temps ta
    //avec un temps de service ts
    if q($, 1) < ta then // aucune requête dans le système
        q($+1,:) = [ta, 1, 1]; // ajout de la requête en fin de liste
    else // inscription de la requête en file d'attente
        ind = sum(q(:, 1) < ta); // recherche du point d'insertion
        q(ind+2:$+1, :) = q(ind+1:$, :); // création d'un trou pour insérer
        q(ind+1,:) = [ta, q(ind,2), 1]; // insertion au bon endroit
        q(ind+1:$,2) = q(ind+1:$,2) + 1; // correction de la taille de
        // la file pour les lignes suivantes
    end
    // Inscription du départ de la requête après son temps de
    // service ts
    //
    s = q($, 1) + ts // calcul de la date de sortie
    q($+1, :) = [s, q($, 2) - 1, -1]; // inscription de la date de
    // sortie à la fin
    //
    // On renvoie la file ainsi modifiée
    newq = q
endfunction




function t = randExp(n, lambda)
// renvoie n réalisation d'une loi exponentielle de paramètre lambda
t = -log(1 - rand(n,1)) / lambda
endfunction

// Strategie semi-circulaire deterministe
// Affecte aux trois serveurs successivement selon la suite optimale de taille 10.
function [Q1, Q2, Q3] = semicircul(Tmax, lambda, mu)
    Q1 = [0, 0, 0]; Q2 = Q1; Q3 = Q1;
    tab=[1,3,2,3,3,1,2,3,3,2];  
    ta = 0;
    while (ta < Tmax)
        for i=1:10
            nq=tab(i);
            ia = randExp(1, lambda) 
            ta = ta + ia 
            ts = randExp(1, mu(nq)) 
            select nq 
            case 1 
                Q1 = insere(Q1, ta, ts)
            case 2
                Q2 = insere(Q2, ta, ts)
            else
                Q3 = insere(Q3, ta, ts)
            end
        end
    end
    Q1 = Q1(Q1(:,1)<Tmax,:)
    Q2 = Q2(Q2(:,1)<Tmax,:) 
    Q3 = Q3(Q3(:,1)<Tmax,:) 
endfunction 

lambda = 1/3; // loi des (inter)-arrivees
mu = [1/15, 1/10, 1/6]; // loi des temps de service des trois serveurs
[Q1, Q2, Q3] = semicircul(3600, lambda, mu); // simulation sur 1 heure
// Traces des courbes
plot2d(Q1(:,1), Q1(:,2), style = 1)
plot2d(Q2(:,1), Q2(:,2), style = 2)
plot2d(Q3(:,1), Q3(:,2), style = 3)
