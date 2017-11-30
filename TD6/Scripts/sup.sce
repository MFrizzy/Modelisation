for i=1:50 // 50 trajectoires
    Q = queue(60, 1/2, 1/10); // lambda est 5 fois plus grand que mu
    plot2d2(Q(:,1), max(Q(:,2) - 1, 0), style=2) // trace la courbe
end
