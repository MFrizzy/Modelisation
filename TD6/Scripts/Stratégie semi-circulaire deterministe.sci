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
//plot2d(Q1(:,1), Q1(:,2), style = 1)
//plot2d(Q2(:,1), Q2(:,2), style = 2)
//plot2d(Q3(:,1), Q3(:,2), style = 3)




// WLH CHOIX 

function [Q1, Q2, Q3,ind1,tq1] = choix(Tmax, lambda, mu)
    Q1 = [0, 0, 0]; Q2 = Q1; Q3 = Q1;
    i = 0;
    ta = 0; 
    while (ta < Tmax)
        ia = randExp(1, lambda)
        i = i+1 
        ta = ta + ia 
        ind1 = sum(Q1(:,1)<ta)// on récupère les files d'attentes de chaque serveur
        ind2 = sum(Q2(:,1)<ta)
        ind3 = sum(Q3(:,1)<ta)
        tq1 = Q1(ind1,2) // on pondère ensuite par le temps de traitement moyen de chaque serveur
        tq2 = Q2(ind2,2)
        tq3 = Q3(ind3,2)
        if tq1 ==min(tq1,tq2,tq3) then // enfin on choisit le serveur qui a le plus petit résultat
            nq = 1
        elseif tq2 ==min(tq1,tq2,tq3)
            nq = 2
        else
            nq = 3
        end
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
    Q1 = Q1(Q1(:,1)<Tmax,:) // on rennvoie les 3 files
    Q2 = Q2(Q2(:,1)<Tmax,:)
    Q3 = Q3(Q3(:,1)<Tmax,:)
endfunction

lambda= 1/3; // le temps entre chaque requête
mu=[1/15,1/10,1/6]; // les temps de traitmement de chaque serveur
[Q1, Q2, Q3,ind1,tq1] = choix(3600, lambda, mu); 
plot2d(Q1(:,1), Q1(:,2), style = 1)
plot2d(Q2(:,1), Q2(:,2), style = 2)
plot2d(Q3(:,1), Q3(:,2), style = 3)

Q=[Q1;Q2;Q3]
Qt=[0,0,0]
Qt=gsort(Q,'r','i')
total=0;
for i=1:length(Q(:,1))
    Qt(i,2)=total;
    [a,b]=find(Q(:,1)==Qt(i,1),1);
    increment=Q(a,3);
    Qt(i,3)=increment;
    total=total+increment
end

plot2d(Qt(:,1), Qt(:,2), style = 5)

legend("Serveur 1","Serveur 2","Serveur 3","Tous les serveurs")
