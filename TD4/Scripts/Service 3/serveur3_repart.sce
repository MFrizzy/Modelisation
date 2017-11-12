clf;
clear;
clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')

// Extraction des temps de service

index_bool = ( data(:, 3) == 3 )
tabS1 = data(index_bool, :)
t_s1 = tabS1(1:$,4);

tab = tabul(t_s1,'i')
tab(:,2) = tab(:,2)/length(t_s1)
F = cumsum(tab(:,2))

plot2d2(tab(:,1),F)
legend("Fonction de répartitions des temps de service")

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];
