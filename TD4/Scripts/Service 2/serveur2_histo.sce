clf;
clear;
clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')

// Extraction des temps de service

index_bool = ( data(:, 3) == 2 )
tabS2 = data(index_bool, :)
t_s2 = tabS2(1:$,4);

deciles=perctl(t_s2,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_s2)
ClassesDeciles(11)=max(t_s2)

C = linspace(0, max(t_s2), 11)

histplot(C,t_s2,style=2)
//histplot(ClassesDeciles,t_s2,style=2)

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];
