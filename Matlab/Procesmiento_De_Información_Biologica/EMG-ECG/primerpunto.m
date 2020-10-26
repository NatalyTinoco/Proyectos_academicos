clear all
close all
clc
signal=load('emg.txt');
%signal=[signal;signal(1000:end)];
%% frecuencia y tiempo de muestreo
Fm=1000;
Tm=1/Fm;
t=0:Tm:length(signal)*Tm-Tm;
%% tiempo de actividad de referencia y ventana  
tamavent=50;
actividadreferencia=tamavent*27; % 1350 muestras  lo hice de esta manera para no tener problemas despues a la hora de hacer ventaneo 

%% Señal a tiempo real y ventaneo 
cont=actividadreferencia;
multiplo=1;
contador=actividadreferencia+tamavent;

for j= 1:length(signal)-1
% no supe como normalizar la señal a tiempo real     
subplot(2,1,1);
plot(t(1:j+1),signal(1:j+1),'c') 
pause(0.001)
cosegnal=signal(1:j+1,1);  
%% la parte donde se toma la actividad de referencia 
    if length(cosegnal)==actividadreferencia
        %cosegnal=cosegnal/norm(cosegnal); 
        VRMS=sqrt((1/length(cosegnal(1:actividadreferencia)))*sum(cosegnal(1:actividadreferencia).^2)); 
        vrmtotal(1:actividadreferencia,1)= VRMS; 
        resta=mean(vrmtotal); 
        hold on
        %vrms referencia 
        plot(t(1,1:actividadreferencia),vrmtotal(1:actividadreferencia,1),'b')
    %% depues de tomar la actividad de referencia comienza a tomar el valor rms por ventana 
    elseif length(cosegnal)>actividadreferencia
         if length(cosegnal)== contador 
    %% rectifico la señal y le resto la actividad de referencia 
            signalrectificada=abs(cosegnal-resta);
    %% valor RMS por ventana de la señal 
            VRMS=sqrt((1/length(signalrectificada(cont:contador)))*sum(signalrectificada(cont:contador).^2)); 
            vrmtotal1(cont:contador,1)= VRMS;    
            subplot(2,1,2);
            hold on
            plot(t(1,cont:contador),signalrectificada(cont:contador,1),'c') 
            hold on;
            plot(t(1,cont-1:contador),vrmtotal1(cont-1:contador,1),'r')
            hold on
      %% filtro a la señal de VRMS 
            [Num,Den] = butter(1,0.006,'low'); 
            %[Num,Den] = butter(1,10/(Fm/2),'low');
            subplot(2,1,1);
            hold on
            signalenvolvente = filtfilt (Num,Den,vrmtotal1+resta);
            plot(t(1,cont-(tamavent/2):contador),signalenvolvente(cont-(tamavent/2):contador,1),'b');
 %%  Detección de la actividad muscular con el ubral 
 
            if mean(signalenvolvente(cont:contador))>= (0.4*(resta/2))+resta
                v(cont:contador,1)=(0.4*resta)+resta;
            else
                v(cont:contador,1)=(resta/2);
            end 
            hold on;
            plot(t(1,cont-1:contador),v(cont-1:contador,1),'r');
            cont=tamavent+cont;
            contador=tamavent+contador;                   
         end
    end
end


subplot(2,1,2)
hold on
plot(t(1,length(signalenvolvente)),signalenvolvente,'b');

   
