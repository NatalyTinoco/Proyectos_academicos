clear all
close all
clc
% abrir la señal
signal=load('emg.txt');
% frecuencia y tiempo de muestreo
Fm=1000;
Tm=1/Fm;
t=0:Tm:length(signal)*Tm-Tm;
tamavent=200;
actividadreferencia=tamavent*7;
cont=actividadreferencia;
multiplo=1;
contador=actividadreferencia+tamavent;
for j= 1:length(signal)-1
subplot(2,1,1);
plot(t(1:j+1),signal(1:j+1),'m') 
pause(0.000001)
cosegnal=signal(1:j+1,1);        
    if length(cosegnal)==actividadreferencia
        VRMS=sqrt((1/length(cosegnal(1:actividadreferencia)))*sum(cosegnal(1:actividadreferencia).^2)); 
        vrmtotal(1:actividadreferencia,1)= VRMS; 
        resta=mean(vrmtotal); 
        hold on
        plot(t(1,1:actividadreferencia),vrmtotal(1:actividadreferencia,1),'b')
    elseif length(cosegnal)>actividadreferencia
         if length(cosegnal)== contador 
            signalrectificada=abs(cosegnal-resta);
            VRMS=sqrt((1/length(signalrectificada(cont:contador)))*sum(signalrectificada(cont:contador).^2)); 
            vrmtotal1(cont:contador,1)= VRMS;     
            subplot(2,1,2);
            hold on
            plot(t(1,cont:contador),signalrectificada(cont:contador,1),'c') 
            hold on
            plot(t(1,cont:contador),vrmtotal1(cont:contador,1),'m')
            hold on
            %[Num,Den] = butter(1,0.009,'low'); 
            [Num,Den] = butter(1,10/(Fm/2),'low'); 
            signalenvolvente = filtfilt (Num,Den,vrmtotal1);
            plot(t(1:length(signalenvolvente)),signalenvolvente,'b');
            if mean(signalenvolvente(cont:contador))>= 0.3*resta
                
            end 
            cont=tamavent+cont;
            contador=tamavent+contador;                   
         end
    end
end

   
