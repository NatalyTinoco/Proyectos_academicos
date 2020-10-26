clear all
close all
clc
% abrir la señal
signal=load('emg.txt');
% frecuencia y tiempo de muestreo
Fm=1000;
Tm=1/Fm;
t=0:Tm:length(signal)*Tm-Tm;
%señal normal
subplot(3,1,1);
plot (t,signal)
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
%FOURIER
L = length(signal); 
sf=fft(signal);
p2=abs(sf/L);
p1 = p2(1:L/2+1);
p1(2:end-1) = 2*p1(2:end-1);                 
f = Fm*(0:(L/2))/L;  
p1=signal;
f=t;
tamavent=210;
cont=1;
contador=tamavent;
multiplo=1;
holo=0;
vrmholo=0;
ventana=zeros(1000000 + holo,1);    
vrmtotal=zeros(floor(length(p1)/tamavent),1);
for j= 1:length(p1)-1
    subplot(3,1,2);
    plot(f(1:j+1),p1(1:j+1),'c') 
    xlabel('Frecuenncia en Hz')
    ylabel('Potencia')
    pause(0.001)
    % seguir
    cosegnal=p1(1:j+1,1);
    holo=holo+1;   
     if length(cosegnal)== contador       
         for i=cont:contador
            ventana=cosegnal(1:contador);
            miventana=ventana(cont:contador); %% mi ventana
            %sacar VRMS POR VENTANA
            sum2=0;
            for na=1:length(miventana)
                sum1=(miventana(na,1))^2;
                sum2=sum1+sum2;
            end   
            Vrms=sqrt((1/length(miventana))*sum2);
            vrmholo=vrmholo+1;
            vrmtotal(vrmholo,1)= Vrms;   
         end
         subplot(3,1,2)
         hold on;
         plot(f(1,cont:contador),vrmtotal(cont:contador,1),'r')
         legend('Fourier','Envolvente')
         beep
        cont=multiplo*tamavent;
        multiplo=multiplo+1;
        contador=multiplo*tamavent;             
     end
end
subplot(4,1,4);
%plot(f,vrmtotal(1:length(f),1))
orden=3;
framelen=11;
sgf = sgolayfilt (vrmtotal(1:length(f)),orden, framelen);
plot(f,sgf)
 