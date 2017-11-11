clf;
clear;
clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')
// Extraction des temps inter-arrivées
t_ia = data(2:$, 2) - data(1:$-1, 2);

index_bool = ( data(:, 3) = 2 )
tab = data(index_bool, :)
t_ia = tab(2:$,2) - tab(1:$-1,2);

deciles=perctl(t_ia,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=min(t_ia)
ClassesDeciles(11)=max(t_ia)

C = linspace(0, max(t_ia), 11)

//histplot(C,t_ia,style=2)
histplot(ClassesDeciles,t_ia,style=2)

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];

//dessin loi normale
a=0:0.01:30
m=mean(t_ia)
v=stdev(t_ia)
b=(1/(v*sqrt(2*%pi))*exp((-1/2)*((a-m)/v)^2))
plot2d2(a,b)
