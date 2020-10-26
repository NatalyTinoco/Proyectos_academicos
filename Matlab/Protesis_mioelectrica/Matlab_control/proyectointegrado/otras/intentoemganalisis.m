clear all;
close all; 
clc;
delete(instrfind({'Port'},{'COM5'})); %inicializa el puerto serial
puerto_serial=serial('COM5');
puerto_serial.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

fopen(puerto_serial); %abre el puerto serial
% parámetros de medidas
tmax = 60; % tiempo de captura en s
%%rate = 33; % resultado experimental (comprobar)

v1 = zeros(1,tmax);
i = 1;
t = 0;
% preparar la figura
f = figure('Name','Captura');
a = axes('XLim',[0 tmax],'YLim',[0 5.1]);
l1 = line(nan,nan,'Color','r','LineWidth',2);

xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
title('Captura de voltaje en tiempo real con Arduino')
grid on
hold on
% ejecutar bucle cronometrado
tic
while t<tmax
    t = toc;
    % leer del puerto serie
    a = fscanf(puerto_serial,'%d')';
    v1(i)=a(1)*5/1023;
    % dibujar en la figura
    x = linspace(0,i/22,i);
    set(l1,'YData',v1(1:i),'XData',x);
    drawnow
    
    % seguir
    i = i+1;
end
archivo = fopen('puñoesteco.txt', 'wt');
for i=1:length(v1)
fprintf( archivo, '\n%f' , v1(1,i));
end
%%open('señalesteco.txt')
winopen('puñoesteco.txt')
fclose(puerto_serial);
delete(puerto_serial);
clear puerto_serial;
