function newq = insere(q, ta, ts)
    if q($, 1) < ta then 
        q($+1,:) = [ta, 1, 1];
    else
        ind = sum(q(:, 1) < ta);
        q(ind+2:$+1, :) = q(ind+1:$, :);
        q(ind+1,:) = [ta, q(ind,2), 1];
        q(ind+1:$,2) = q(ind+1:$,2) + 1;
    end
    s = q($, 1) + ts 
    q($+1, :) = [s, q($, 2) - 1, -1];
    newq = q
endfunction
