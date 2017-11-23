function t = V(l,n)
    u = rand(n, 1);
    t = u
    t = -log(1-t)/l 
endfunction

histplot(10,V(1,10000))
