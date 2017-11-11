clf;
clear;
clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')

// Extraction des temps de service

index_bool = ( data(:, 3) = 1 )
tabS1 = data(index_bool, :)
t_s1 = tabS1(1:$,4);

deciles=perctl(t_s1,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_s1)
ClassesDeciles(11)=max(t_s1)

C = linspace(0, max(t_s1), 11)

//histplot(C,t_ia,style=2)
histplot(ClassesDeciles,t_s1,style=2)

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];

// Dessin loi normale
a=0:0.01:140
m=mean(t_s1)
v=stdev(t_s1)
b=(1/(v*sqrt(2*%pi))*exp((-1/2)*((a-m)/v)^2))

plot2d2(a,b,style=3)
