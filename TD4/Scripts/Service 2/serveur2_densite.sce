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

histplot(ClassesDeciles,t_s2,style=2)

// Densité de la loi normale
a=min(t_s2):0.01:max(t_s2)
m=mean(t_s2)
v=stdev(t_s2)
b=(1/(v*sqrt(2*%pi))*exp((-1/2)*((a-m)/v)^2))
plot2d2(a,b,style=1)

// Densité de la loi exponentielle
lambda=1/mean(t_s2)
b=lambda*exp(-lambda*a)
plot2d2(a,b,style=3)

// Densité de la loi uniforme
h=1/(max(t_s2)-min(t_s2))
b=ones(a)*h
plot2d2(a,b,style=20)

legend("Histogramme d isofréquence du serveur 2","Densité de la loi normale","Densité de la loi exponentielle","Densité de la loi uniforme")

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];
