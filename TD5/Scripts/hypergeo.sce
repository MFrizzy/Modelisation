clear
clc
function s=hypergeo(N,n,P)
    M=P*N;
    s=0;
    for i=0:n-1
        if rand()<P
            M=M-1;
            N=N-1;
            s=s+1;
            P=M/N;
        else
            N=N-1;
            P=M/N;
        end         
    end
endfunction
N=20; n=3; P=2/20;t=[];
for j=1:100
    t(j)=hypergeo(N,n,P); //100 tirages de loi hypergeo
end
frequences=tabul(t)    // on calcule les frequences obtenues
disp(frequences)
