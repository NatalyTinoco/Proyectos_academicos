% Profe encontre una caracteristica en matlaba que calcula el oblicuedad de
% una curva, se me ocurrio al ver las grficas que podria funciona, aun asi
% no me convence 

clear all
close all
clc
cantidad=14;
BaseFile = 'c';
for h=1:cantidad
%% Leer todos los archivos 
    signal=load([BaseFile num2str(h) '.dat']);
%% frecuencia y tiempo de muestreo
    Fm=1024;
    Tm=1/Fm;
    t=0:Tm:length(signal)*Tm-Tm;
    figure (h)
    subplot(2,1,1)
    plot(t,signal)
%% calcular el espectro de potencias 
    % %FOURIER
    L = length(signal); 
    sf=fft(signal);
    p2=abs(sf/L);
    P = p2(1:L/2+1);
    P(2:end-1) = 2*P(2:end-1);                 
    F= Fm*(0:(L/2))/L;  
    subplot(2,1,2)
    plot(F,P,'c')
%% tamaño de las ventanas  y ventaneo 
    tamavent=90;
    cont=1;
    multiplo=1;
    for j=tamavent:tamavent:length(P)+1
        VRMS=sqrt((1/length(P(cont:j)))*sum(P(cont:j).^2)); 
        vrmtotal(cont:j,1)= VRMS; 
        cont=multiplo*tamavent;
        multiplo=multiplo+1;  
    end
%% filtro a la  señal con los valores de VRMS por ventan 
    [Num,Den] = butter(1,0.005,'low');
    %[Num,Den] = butter(1,fm/2,'low');
    pasab = filtfilt (Num,Den,vrmtotal);

%%   Grafica de las señales, lo hice de esta manera porque al gunas veces los tamaños de las señales variaban 
    if length(vrmtotal)<length(F)
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
       
    else
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
      
    end 
    
%% guardar el valor de la oblicueda de todos las señales y calcular cual es la mayor, por segun lo que vi en las señales era más empinada 
 oblicuedad(h)=skewness(pasab);
    
    if  h==1
        omayor=oblicuedad(h);
    elseif  omayor>oblicuedad(h)  
        omayor=omayor;
    else
        omayor=oblicuedad(h);
         puntoh=h;
    end
        
end 

%%  se muestra en pantlla en cual txt se encontro la fatiga y cual fue la frecuencia mediana 

disp('Fatiga en el txt:')
disp(puntoh)
disp('Oblicuedad')
disp(omayor)

