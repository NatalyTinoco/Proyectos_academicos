clear all
close all
clc
signal=load('emg.txt');

%% normalizado
signal=signal/norm(signal);
% frecuencia y tiempo de muestreo
Fm=1000;
Tm=1/Fm;
t=0:Tm:length(signal)*Tm-Tm;
%señal normal
subplot(2,1,1);
plot (t,signal)
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')

%% tiempo de actividad de referencia y ventana 
trefencia=3700;
tamavent=200;
%% restar la actividad de referencia y rectificar la señal
VRMSreferencia=sqrt((1/trefencia)*sum(signal(1:trefencia).^2));
signalreftificada=abs(signal-VRMSreferencia);
subplot(2,1,2);
plot(t,signalreftificada,'c')

%% Sacar valor RMS por ventana 
cont=1;
multiplo=1;
for j=tamavent:tamavent:length(signalreftificada)+1
    VRMS=sqrt((1/length(signalreftificada(cont:j)))*sum(signalreftificada(cont:j).^2)); 
    vrmtotal(cont:j,1)= VRMS; 
    cont=multiplo*tamavent;
    multiplo=multiplo+1;  
end
hold on;
plot(t(1:length(vrmtotal)),vrmtotal,'r');

%% Filtrado para la envolvente 

%[Num,Den] = butter(1,10/(Fm/2),'low'); 
[Num,Den] = butter(1,0.006,'low'); 
subplot(2,1,2)
signalenvolvente = filtfilt (Num,Den,vrmtotal);
plot(t(1:length(signalenvolvente)),signalenvolvente,'k');


figure 
plot(t(1:length(signalenvolvente)),signalenvolvente+VRMSreferencia,'k');
hold on
plot(t,signal,'c')

%% detectar la activación según el umbral 
cont1=1;
mul=1;
signalenvolvente=signalenvolvente+VRMSreferencia;
for m=tamavent:tamavent:length(signalenvolvente)+1
if mean(signalenvolvente(cont1:m,1))>=(0.15*VRMSreferencia)+ VRMSreferencia
  v(cont1:m,1)=0.4*VRMSreferencia+VRMSreferencia;
else
       v(cont1:m,1)=VRMSreferencia*0.4;
end 
 cont1=mul*tamavent;
 mul=mul+1;  
end
title ('ACTIVACIÓN MUSCULAR')
hold on;
plot(t(1,1:length(v)),v,'r')



          
   