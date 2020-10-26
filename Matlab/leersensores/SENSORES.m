clear all;
close all; 
clc;

global y x

y=zeros(1,1000); %vector donde se guardan los datos
x=zeros(1,1000);
delete(instrfind({'Port'},{'COM3'})); %inicializa el puerto serial
puerto_serial=serial('COM3');
puerto_serial.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

fopen(puerto_serial); %abre el puerto serial
contador_muestras=1; 
numero_muestras=1000;


%grafica
figure('Name','Serial communication:Matlab + Arduino')
grid on;
hold on;

while contador_muestras<=numero_muestras
    subplot(2,1,1)
    xlim([contador_muestras-20 contador_muestras+5])
    valor=fscanf(puerto_serial,'%d,%d');
    y(contador_muestras)=valor(1);
    a=(1023-y(contador_muestras));
    plot(contador_muestras,a,'*-g')
    grid on; hold on;
    title('GRAFICA DE HUMEDAD');
    xlabel('');
    ylabel('% Humedad ');
    %TEMPERATURA
    subplot(2,1,2)
    xlim([contador_muestras-20 contador_muestras+5])
    x(contador_muestras)=(valor(2)*5*100)/1024;
    plot(contador_muestras,x(contador_muestras),'X-b')
    grid on; hold on;
    title('GRAFICA DE TEMPERATURA');
    xlabel('Tiempo');
    ylabel('Temperatura (°C)');
    drawnow
    contador_muestras=contador_muestras+1;
end

fclose(puerto_serial);
delete(puerto_serial);
clear all

