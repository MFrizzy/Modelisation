clf;
clear;
clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')

// Extraction des temps de service

index_bool = ( data(:, 3) == 3 )
tabS3 = data(index_bool, :)
t_s3 = tabS3(1:$,4);

// Repartition empirique
tab = tabul(t_s3,'i')
tab(:,2) = tab(:,2)/length(t_s3)
F = cumsum(tab(:,2))

plot2d2(tab(:,1),F)

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];

// Répartition loi normale
a=min(t_s3):0.01:max(t_s3)
m=ones(a)*mean(t_s3)
s=ones(a)*stdev(t_s3)
[P,Q]=cdfnor("PQ",a,m,s)
plot2d2(a,P,style=2)

// Repartition loi exponentielle
lambda=1/mean(t_s3)
b=1-exp(-lambda*a)
plot2d2(a,b,style=3)

// Repartition loi uniforme
c=(a-min(t_s3))/(max(t_s3)-min(t_s3))
plot2d2(a,c,style=4)

legend("Courbe de la fonction de répartition empirique","Courbe de la fonction de répartition de la loi normale","Courbe de la fonction de répartition de la exponentielle","Courbe de la fonction de répartition la loi uniforme")
