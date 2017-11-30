function newq = insere(q, ta, ts)
//
// Inscription de l'arrivée d'une requête 
//      dans la file q, 
//      au temps ta
//      avec un temps de service ts
    if q($, 1) < ta then // aucune requête dans le système
        q($+1,:) = [ta, 1, 1]; // ajout de la requête en fin de liste
    else // inscription de la requête en file d'attente
        ind = sum(q(:, 1) < ta); // recherche du point d'insertion
        q(ind+2:$+1, :) = q(ind+1:$, :); // création d'un trou pour insérer
        q(ind+1,:) = [ta, q(ind,2), 1]; // insertion au bon endroit
        q(ind+1:$,2) = q(ind+1:$,2) + 1; // correction de la taille de
                                         // la file pour les lignes suivantes
    end
//                                         
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
