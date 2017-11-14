clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')



//SERVER1
extremesS1 = [min(t_s1), max(t_s1)] // calcul du min et du max
moyenneS1 = mean(t_s1) // calcul de la moyenne
medianeS1 = perctl(t_s1,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
vS1 = variance(t_s1)
sS1 = stdev(t_s1)
// calcul de l'étendue
etendueS1 = extremesS1(2) - extremesS1(1)
Q1S1 = perctl(t_s1, 25) // premier quartile
Q3S1 = perctl(t_s1, 75) // troisième quartile
IQS1 = Q3S1(1) - Q1S1(1) // intervalle interquartile

index_bool1 = (t_s1 > 1);
tab_s1 = t_s1(index_bool1);
new_t_s1 = tab_s1 - 1;
extremes1 = [min(new_t_s1), max(new_t_s1)] // calcul du min et du max
moyenne1 = mean(new_t_s1) // calcul de la moyenne
mediane1 = perctl(new_t_s1,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
v1 = variance(new_t_s1)
e1 = stdev(new_t_s1)
// calcul de l'étendue
etendue1 = extremes1(2) - extremes1(1)
Q1_1 = perctl(new_t_s1, 25) // premier quartile
Q3_1 = perctl(new_t_s1, 75) // troisième quartile
IQ1 = Q3_1(1) - Q1_1(1) // intervalle interquartile

comparaison1 = [moyenne1 - moyenneS1, mediane1(1) - medianeS1(1), v1 - vS1, e1 - sS1, etendue1 - etendueS1]

subplot(1,2,1)
deciles=perctl(t_s1,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_s1)
ClassesDeciles(11)=max(t_s1)
histplot(ClassesDeciles,t_s1,style=2)
legend("Histogramme avec temps de service")

subplot(1,2,2)
histplot(ClassesDeciles,new_t_s1,style=1)
legend("Histogramme avec temps de services à partir de 1 seconde")

//SERVER2
extremesS2 = [min(t_s2), max(t_s2)] // calcul du min et du max
moyenneS2 = mean(t_s2) // calcul de la moyenne
medianeS2 = perctl(t_s2,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
vS2 = variance(t_s2)
sS2 = stdev(t_s2)
// calcul de l'étendue
etendueS2 = extremesS2(2) - extremesS2(1)
Q1S2 = perctl(t_s2, 25) // premier quartile
Q3S2 = perctl(t_s2, 75) // troisième quartile
IQS2 = Q3S2(1) - Q1S2(1) // intervalle interquartile

index_bool2 = (t_s2 > 1)
tab_s2 = t_s2(index_bool2)
new_t_s2 = tab_s2 - 1
extremes2 = [min(new_t_s2), max(new_t_s2)] // calcul du min et du max
moyenne2 = mean(new_t_s2) // calcul de la moyenne
mediane2 = perctl(new_t_s2,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
v2 = variance(new_t_s2)
e2 = stdev(new_t_s2)
// calcul de l'étendue
etendue2 = extremes2(2) - extremes2(1)
Q1_2 = perctl(new_t_s2, 25) // premier quartile
Q3_2 = perctl(new_t_s2, 75) // troisième quartile
IQ2 = Q3_2(1) - Q1_2(1) // intervalle interquartile

comparaison2 = [moyenne2 - moyenneS2, mediane2(1) - medianeS2(1), v2 - vS2, e2 - sS2, etendue2 - etendueS2]

subplot(1,2,1)
deciles=perctl(t_s2,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_s2)
ClassesDeciles(11)=max(t_s2)
histplot(ClassesDeciles,t_s2,style=2)
legend("Histogramme avec temps de service")

subplot(1,2,2)
histplot(ClassesDeciles,new_t_s2,style=1)
legend("Histogramme avec temps de services à partir de 1 seconde")

//SERVER3
extremesS3 = [min(t_s3), max(t_s3)] // calcul du min et du max
moyenneS3 = mean(t_s3) // calcul de la moyenne
medianeS3 = perctl(t_s3,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
vS3 = variance(t_s3)
sS3 = stdev(t_s3)
// calcul de l'étendue
etendueS3 = extremesS3(2) - extremesS3(1)
Q1S3 = perctl(t_s3, 25) // premier quartile
Q3S3 = perctl(t_s3, 75) // troisième quartile
IQS3 = Q3S3(1) - Q1S3(1) // intervalle interquartile

index_bool3 = (t_s3 > 1)
tab_s3 = t_s3(index_bool3)
new_t_s3 = tab_s3 - 1
extremes3 = [min(new_t_s3), max(new_t_s3)] // calcul du min et du max
moyenne3 = mean(new_t_s3) // calcul de la moyenne
mediane3 = perctl(new_t_s3,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
v3 = variance(new_t_s3)
e3 = stdev(new_t_s3)
// calcul de l'étendue
etendue3 = extremes3(2) - extremes3(1)
Q1_3 = perctl(new_t_s3, 25) // premier quartile
Q3_3 = perctl(new_t_s3, 75) // troisième quartile
IQ3 = Q3_3(1) - Q1_3(1) // intervalle interquartile

comparaison3 = [moyenne3 - moyenneS3, mediane3(1) - medianeS3(1), v3 - vS3, e3 - sS3, etendue3 - etendueS3]

subplot(1,2,1)
deciles=perctl(t_s3,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_s3)
ClassesDeciles(11)=max(t_s3)
histplot(ClassesDeciles,t_s3,style=2)
legend("Histogramme avec temps de service")

subplot(1,2,2)
histplot(ClassesDeciles,new_t_s3,style=1)
legend("Histogramme avec temps de services à partir de 1 seconde")


// Temps interarrivés

extremesS = [min(t_ia), max(t_ia)] // calcul du min et du max
moyenneS = mean(t_ia) // calcul de la moyenne
medianeS = perctl(t_ia,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
vS = variance(t_ia)
sS = stdev(t_ia)
// calcul de l'étendue
etendueS = extremesS(2) - extremesS(1)
Q1S = perctl(t_ia, 25) // premier quartile
Q3S = perctl(t_ia, 75) // troisième quartile
IQS = Q3S(1) - Q1S(1) // intervalle interquartile

index_bool3 = (t_ia > 1)
tab_ia = t_ia(index_bool3)
new_t_ia = tab_ia - 1
extremes_ia = [min(new_t_ia), max(new_t_ia)] // calcul du min et du max
moyenne_ia = mean(new_t_ia) // calcul de la moyenne
mediane_ia = perctl(new_t_ia,50) // calcul de la mediane
// calcul de la variance et de l'écart-type
v = variance(new_t_ia)
e = stdev(new_t_ia)
// calcul de l'étendue
etendue = extremes_ia(2) - extremes_ia(1)
Q1_ = perctl(new_t_ia, 25) // premier quartile
Q3_ = perctl(new_t_ia, 75) // troisième quartile
IQ = Q3_(1) - Q1_(1) // intervalle interquartile

comparaison = [moyenne_ia - moyenneS, mediane_ia(1) - medianeS(1), v - vS, e - sS, etendue - etendueS]

subplot(1,2,1)
deciles=perctl(t_ia,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_ia)
ClassesDeciles(11)=max(t_ia)
histplot(ClassesDeciles,t_ia,style=2)
legend("Histogramme avec temps de service")

subplot(1,2,2)
histplot(ClassesDeciles,new_t_ia,style=1)
legend("Histogramme avec temps de services à partir de 1 seconde")

