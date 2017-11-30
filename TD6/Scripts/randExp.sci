function t = randExp(n, lambda)
    t = -log(1 - rand(n,1)) / lambda
endfunction
