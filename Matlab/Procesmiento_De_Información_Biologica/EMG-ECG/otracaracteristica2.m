% Profe  en esta encontre el pico mas alto de pontencia y lo dividi en dos,
% y encontre uno de los puntos donde cortba la grafica, para calcular la
% distancia entre el punto de la mitad y un extremo de la grafica

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
%% calacular el punto maximo de frecuencia  y la ubicación del punto medio 
[valorp, ubicp] = findpeaks(pasab,'sortstr','descend');
k=1;
  for i=1:length(pasab)
  if pasab(i)>= valorp(1,1)/2
    u(1:length(F))=pasab(i);  
    m(k)=i;
    k=k+1;
  end
  end
  

%%   Grafica de las señales, lo hice de esta manera porque al gunas veces los tamaños de las señales variaban 
    if length(vrmtotal)<length(F)
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
        hold on;
        plot(F(1,1:length(u)),u,'r') 
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
       
    else
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
         hold on;
        plot(F,u(1,1:length(F)),'r') 
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
      
    end 
    
%% guardar el valor de la distancia entre los puntos de cada una de  las señales y calcular cual es la mayor
hold on;
[minimo,position]=min(abs(pasab-valorp(1,1)/2));
mas_cercano=pasab(position);
plot(F(ubicp(1,1)),(pasab(ubicp(1,1))/2),'*g')
hold on;
if length(F)> position
plot(F(position),pasab(position),'*g')
distancia(h)=sqrt((F(position)-F(ubicp(1,1)))^2 + (pasab(position)-(pasab(ubicp(1,1))/2))^2);
else
   plot(F(1),pasab(1),'*g')
  distancia(h)=sqrt((F(1)-F(ubicp(1,1)))^2 + (pasab(1)-(pasab(ubicp(1,1))/2))^2);
end

if  h==1
    dmenor=distancia(h);
elseif  dmenor>distancia(h)  
    dmenor=dmenor;
else
    dmenor=distancia(h);
    puntot=h;
end
        
end 

%%  se muestra en pantlla en cual txt se encontro la fatiga y cual fue la frecuencia mediana 

disp('Fatiga en el txt:')
disp(puntot)
disp('Distancia')
disp(dmenor)

