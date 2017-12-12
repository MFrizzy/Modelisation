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
[Q1, Q2, Q3] = circul(3600, lambda, mu); // simulation sur 1 heure
// Traces des courbes
plot2d(Q1(:,1), Q1(:,2), style= 1)
plot2d(Q2(:,1), Q2(:,2), style= 2)
plot2d(Q3(:,1), Q3(:,2), style= 3)

function t_mr = texecut(Q1, Q2, Q3)
    //requetes sorties
    Q_s1 = Q1(Q1(:,3) == -1,1)
    Q_s2 = Q2(Q2(:,3) == -1,1)
    Q_s3 = Q3(Q3(:,3) == -1,1)
    
    //length file d'attentes requetes sorties
    l_s1 = length(Q_s1)
    l_s2 = length(Q_s2)
    l_s3 = length(Q_s3)
    
    //requetes entrées
    Q_re1 = Q1(Q1(:,3) == 1,1)
    Q_re2 = Q2(Q2(:,3) == 1,1)
    Q_re3 = Q3(Q3(:,3) == 1,1)
    
    //nb requetes entrées = nb requetes sorties
    Q_e1 = Q_re1(1:l_s1,1)
    Q_e2 = Q_re2(1:l_s2,1)
    Q_e3 = Q_re3(1:l_s3,1)
    
    //temps sortie - temps entrée 
    t_e1 = Q_s1 - Q_e1
    t_e2 = Q_s2 - Q_e2
    t_e3 = Q_s3 - Q_e3
    
    //temps moyen requete par serveur
    t1 = mean(t_e1)
    t2 = mean(t_e2)
    t3 = mean(t_e3)
    
    //temps moyen systeme
    t_mr = (t1+t2+t3)/3

endfunction

function [t1,t2,t3] = ttexecut(Q1,Q2,Q3)
    //requetes sorties
    Q_s1 = Q1(Q1(:,3) == -1,1)
    Q_s2 = Q2(Q2(:,3) == -1,1)
    Q_s3 = Q3(Q3(:,3) == -1,1)
    
    //length file d'attentes requetes sorties
    l_s1 = length(Q_s1)
    l_s2 = length(Q_s2)
    l_s3 = length(Q_s3)
    
    //requetes entrées
    Q_re1 = Q1(Q1(:,3) == 1,1)
    Q_re2 = Q2(Q2(:,3) == 1,1)
    Q_re3 = Q3(Q3(:,3) == 1,1)
    
    //nb requetes entrées = nb requetes sorties
    Q_e1 = Q_re1(1:l_s1,1)
    Q_e2 = Q_re2(1:l_s2,1)
    Q_e3 = Q_re3(1:l_s3,1)
    
    //temps sortie - temps entrée 
    t_e1 = Q_s1 - Q_e1
    t_e2 = Q_s2 - Q_e2
    t_e3 = Q_s3 - Q_e3
    
    //temps moyen requete par serveur
    t1 = mean(t_e1)
    t2 = mean(t_e2)
    t3 = mean(t_e3)
endfunction


t_rm = texecut(Q1,Q2,Q3)

// nombre de requetes dans le système

function nb_r = calculrequete(Tmax, lambda)
    tia_moyen = 1/lambda
    nb_r = Tmax/tia_moyen
endfunction
nb_r = calculrequete(3600, 1/3)
