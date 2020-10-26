load('fisheriris.mat');
%DIAGRAMAS DE DISPERSIÓN
%virginica-versicolor
figure (1)
title('virginica-versicolor')
%1
subplot(3,2,1)
scatter(virginica(:,1),virginica(:,2),'*r');
hold on;
scatter(versicolor(:,1),versicolor(:,2),'*b');
xlabel('Longitud sepalo');
ylabel('Ancho sepalo');
legend('Virginica','Versicolor')
%2
subplot(3,2,2)
scatter(virginica(:,1),virginica(:,3),'*r');
hold on;
scatter(versicolor(:,1),versicolor(:,3),'*b');
xlabel('Longitud sepalo');
ylabel('Longitud petalo');
legend('Virginica','Versicolor')
%3
subplot(3,2,3)
scatter(virginica(:,1),virginica(:,4),'*r');
hold on;
scatter(versicolor(:,1),versicolor(:,4),'*b');
xlabel('longitud sepalo');
ylabel('Ancho petalo');
legend('Virginica','Versicolor')
%4
subplot(3,2,4)
scatter(virginica(:,2),virginica(:,3),'*r');
hold on;
scatter(versicolor(:,2),versicolor(:,3),'*b');
xlabel('Ancho sepalo');
ylabel('Longitud petalo');
legend('Virginica','Versicolor')
%5
subplot(3,2,5)
scatter(virginica(:,2),virginica(:,4),'*r');
hold on;
scatter(versicolor(:,2),versicolor(:,4),'*b');
xlabel('Ancho sepalo');
ylabel('Ancho petalo');
legend('Virginica','Versicolor')
%6
subplot(3,2,6)
scatter(virginica(:,3),virginica(:,4),'*r');
hold on;
scatter(versicolor(:,3),versicolor(:,4),'*b');
xlabel('Longitud petalo');
ylabel('Ancho petalo');
legend('Virginica','Versicolor')
%%
figure(2)
title('virginica-setosa')
%1
subplot(3,2,1)
scatter(virginica(:,1),virginica(:,2),'*r');
hold on;
scatter(setosa(:,1),setosa(:,2),'*b');
xlabel('Longitud sepalo');
ylabel('Ancho sepalo');
legend('Virginica','setosa')
%2
subplot(3,2,2)
scatter(virginica(:,1),virginica(:,3),'*r');
hold on;
scatter(setosa(:,1),setosa(:,3),'*b');
xlabel('Longitud sepalo');
ylabel('Longitud petalo');
legend('Virginica','setosa')
%3
subplot(3,2,3)
scatter(virginica(:,1),virginica(:,4),'*r');
hold on;
scatter(setosa(:,1),setosa(:,4),'*b');
xlabel('longitud sepalo');
ylabel('Ancho petalo');
legend('Virginica','setosa')
%4
subplot(3,2,4)
scatter(virginica(:,2),virginica(:,3),'*r');
hold on;
scatter(setosa(:,2),setosa(:,3),'*b');
xlabel('Ancho sepalo');
ylabel('Longitud petalo');
legend('Virginica','setosa')
%5
subplot(3,2,5)
scatter(virginica(:,2),virginica(:,4),'*r');
hold on;
scatter(setosa(:,2),setosa(:,4),'*b');
xlabel('Ancho sepalo');
ylabel('Ancho petalo');
legend('Virginica','setosa')
%6
subplot(3,2,6)
scatter(virginica(:,3),virginica(:,4),'*r');
hold on;
scatter(setosa(:,3),setosa(:,4),'*b');
xlabel('Longitud petalo');
ylabel('Ancho petalo');
legend('Virginica','setosa')
%%
figure(3)
title('versicolor-setosa')
%1
subplot(3,2,1)
scatter(versicolor(:,1),versicolor(:,2),'*r');
hold on;
scatter(setosa(:,1),setosa(:,2),'*b');
xlabel('Longitud sepalo');
ylabel('Ancho sepalo');
legend('versicolor','setosa')
%2
subplot(3,2,2)
scatter(versicolor(:,1),versicolor(:,3),'*r');
hold on;
scatter(setosa(:,1),setosa(:,3),'*b');
xlabel('Longitud sepalo');
ylabel('Longitud petalo');
legend('versicolor','setosa')
%3
subplot(3,2,3)
scatter(versicolor(:,1),versicolor(:,4),'*r');
hold on;
scatter(setosa(:,1),setosa(:,4),'*b');
xlabel('longitud sepalo');
ylabel('Ancho petalo');
legend('versicolor','setosa')
%4
subplot(3,2,4)
scatter(versicolor(:,2),versicolor(:,3),'*r');
hold on;
scatter(setosa(:,2),setosa(:,3),'*b');
xlabel('Ancho sepalo');
ylabel('Longitud petalo');
legend('versicolor','setosa')
%5
subplot(3,2,5)
scatter(versicolor(:,2),versicolor(:,4),'*r');
hold on;
scatter(setosa(:,2),setosa(:,4),'*b');
xlabel('Ancho sepalo');
ylabel('Ancho petalo');
legend('versicolor','setosa')
%6
subplot(3,2,6)
scatter(versicolor(:,3),versicolor(:,4),'*r');
hold on;
scatter(setosa(:,3),setosa(:,4),'*b');
xlabel('Longitud petalo');
ylabel('Ancho petalo');
legend('versicolor','setosa')
%%
%Longitud sepalo
figure
subplot(2,2,1)
boxplot([versicolor(:,1),virginica(:,1),setosa(:,1)],'Notch','on','Labels',{'Versicolor','Virginica','Setosa'})
title('Comparación longitud sepalo de las 3 flores')
xlabel('Tipo de flor');
ylabel('Longitud sepalo');
subplot(2,2,2)
boxplot([versicolor(:,2),virginica(:,2),setosa(:,2)],'Notch','on','Labels',{'Versicolor','Virginica','Setosa'})
title('Comparación Ancho sepalo de las 3 flores')
xlabel('Tipo de flor');
ylabel('Ancho sepalo ');
subplot(2,2,3)
boxplot([versicolor(:,3),virginica(:,3),setosa(:,3)],'Notch','on','Labels',{'Versicolor','Virginica','Setosa'})
title('Comparación Longitud petalo de las 3 flores')
xlabel('Tipo de flor');
ylabel('Longitud petalo');
subplot(2,2,4)
boxplot([versicolor(:,4),virginica(:,4),setosa(:,4)],'Notch','on','Labels',{'Versicolor','Virginica','Setosa'})
title('Comparación Ancho petalo de las 3 flores')
xlabel('Tipo de flor');
ylabel('Ancho petalo');




