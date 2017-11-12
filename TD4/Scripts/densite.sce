clf;
clear;
clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')

// Extraction des temps inter-arrivées
t_ia = data(2:$, 2) - data(1:1237, 2);

// Histogramme
deciles=perctl(t_ia,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_ia)
ClassesDeciles(11)=max(t_ia)
histplot(ClassesDeciles,t_ia,style=2)

// Densité de la loi normale
a=min(t_ia):0.01:max(t_ia)
m=mean(t_ia)
v=stdev(t_ia)
b=(1/(v*sqrt(2*%pi))*exp((-1/2)*((a-m)/v)^2))
plot2d2(a,b,style=1)

// Densité de la loi exponentielle
lambda=1/mean(t_ia)
b=lambda*exp(-lambda*a)
plot2d2(a,b,style=3)

// Densité de la loi uniforme
h=1/(max(t_ia)-min(t_ia))
b=ones(a)*h
plot2d2(a,b,style=20)

legend("Histogramme d isofréquence des temps interarrivés","Densité de la loi normale","Densité de la loi exponentielle","Densité de la loi uniforme")

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];
