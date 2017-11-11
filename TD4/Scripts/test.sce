clf;
clear;
clc;
load('C:\Users\tangu\OneDrive\Documents\GitHub\Modelisation\TD4\NetworkData.sod')
// Extraction des temps inter-arrivées
t_ia = data(2:$, 2) - data(1:1237, 2);
tab = tabul(t_ia, 'i'); // construction du tableau des effectifs
tab(:,2) = tab(:,2)/length(t_ia); // calcul des fréquences
F = cumsum(tab(:,2)); // calcul des fréquences cumulées

extremes = [min(t_ia), max(t_ia)] // calcul du min et du max

moyenne = mean(t_ia)  // calcul de la moyenne

mediane = perctl(t_ia,50) // calcul de la mediane

// calcul de la variance et de l'écart-type
v = variance(t_ia)
s = stdev(t_ia)

// calcul de l'étendue
etendue = extremes(2) - extremes(1)




Q1 = perctl(t_ia, 25) // premier quartile
Q3 = perctl(t_ia, 75) // troisième quartile
IQ = Q3(1) - Q1(1) // intervalle interquartile :

// Calcul de la fonction histogramme
C = linspace(0, extremes(2), 11)


//useless
[ind, ni] = dsearch(t_ia, C);
ni
amplitude = C(2:$) - C(1:$-1)
histo=(ni / length(t_ia)) ./ amplitude
//useless

deciles=perctl(t_ia,10:10:90);
for i=2:10
    ClassesDeciles(i)=deciles(i-1)
end
ClassesDeciles(1)=extremes(1)
ClassesDeciles(11)=extremes(2)
histplot(ClassesDeciles,t_ia,style=2,fill='true')
hist=histc(C,t_ia)
//histplot(C, t_ia, style=2,)


//dessin loi exponentielle
a=0:0.01:22
lambda=1/moyenne
b=lambda*exp(-lambda*a)
plot2d2(a,b)

// Définition des paramètres d'affichages
a=gca();
a.x_location = "origin";
a.grid=[5,5];


