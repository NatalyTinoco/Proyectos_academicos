clear all;
close all; 
clc;

y=zeros(1,1000); %vector donde se guardan los datos

delete(instrfind({'Port'},{'COM6'})); %inicializa el puerto serial
puerto_serial=serial('COM6');
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
    subplot(2,2,1)
    ylim([0 5.1]);
    xlim([contador_muestras-20 contador_muestras+5]);
    valor_humedad=fscanf(puerto_serial,'%d');
    y(contador_muestras)=(valor_humedad(1)*5)/1024;
    plot(contador_muestras,y(contador_muestras),'X-r');grid on; hold on;
    title('% VOLTAJE VS N° DATOS ')
    xlabel ('N° de datos')
    ylabel ('Voltaje(V)')
    subplot(2,2,2)
    a=100*((y(contador_muestras)-0.958)/0.0307) ;
    plot(contador_muestras,a,'-r');grid on; hold on;
    title('% HUMEDAD RELATIVA VS N° DATOS ')
    xlabel ('N° de datos')
    ylabel ('% Humedad ralativa ')
end

fclose(puerto_serial);
delete(puerto_serial);
clear all

