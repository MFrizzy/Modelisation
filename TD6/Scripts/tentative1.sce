function [Q1, Q2, Q3] = aleaProp(Tmax, lambda, mu)
    Q1 = [0, 0, 0]; Q2 = Q1; Q3 = Q1;
    i = 0;
    ta = 0;
    while (ta < Tmax)
        ia = randExp(1, lambda)
        i = i+1
        ta = ta + ia 
        nq = num_serv() 
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
    Q1 = Q1(Q1(:,1)<Tmax,:)
    Q2 = Q2(Q2(:,1)<Tmax,:) 
    Q3 = Q3(Q3(:,1)<Tmax,:) 
endfunction 

lambda= 1/3;
mu = [1/15, 1/10, 1/6]; 
[Q1, Q2, Q3] = aleaProp(36000, lambda, mu); 

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

[m1,m2,m3,t_rm] = texecute(Q1,Q2,Q3)

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

legend("Serveur 1","Serveur 2","Serveur 3")
