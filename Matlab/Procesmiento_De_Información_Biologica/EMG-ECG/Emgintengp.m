clear all
close all
clc
cantidad=14;
BaseFile = 'c';
for h=1:cantidad
    signal=load([BaseFile num2str(h) '.dat']);
        % frecuencia y tiempo de muestreo
        Fm=1024;
        Tm=1/Fm;
        t=0:Tm:length(signal)*Tm-Tm;
        %FOURIER
        L = length(signal); 
        sf=fft(signal);
        p2=abs(sf/L);
        p1 = p2(1:L/2+1);
        p1(2:end-1) = 2*p1(2:end-1);                 
        f = Fm*(0:(L/2))/L;  
        % VENTANAS
        tamavent=60;
        cont=1;
        multiplo=1;
        for j=tamavent:tamavent:length(p1)
            suma=sum(p1(cont:j).^2);
            Vrms=sqrt((1/length(p1(cont:j)))*suma);
            vrmtotal(cont:j,1)= Vrms; 
            cont=multiplo*tamavent;
            multiplo=multiplo+1;
        end
        [Num,Den] = butter(1,0.006,'low'); 
        pasab = filtfilt (Num,Den,vrmtotal);
        if h<=8
            figure (1)
            if length(vrmtotal)<length(f)
                subplot(4,2,h)
                plot(f(1,1:length(vrmtotal)),pasab)
                title(h)
                xlabel('Frecuenncia en Hz')
                ylabel('Potencia')
                fmediana=medfreq(abs(pasab),f(1,1:length(pasab)));
                hold on
                plot([fmediana fmediana], ylim, '-r', 'LineWidth',1)      
            else
                subplot(4,2,h) 
                plot(f,pasab(1:length(f),1))
                title(h)
                xlabel('Frecuenncia en Hz')
                ylabel('Potencia')
                fmediana=medfreq(abs(pasab(1:length(f),1)),f);
                hold on
                plot([fmediana fmediana], ylim, '-r', 'LineWidth',1) 
            end
        else
            figure (2)
            c=h-8;
            if length(vrmtotal)<length(f)
                subplot(3,2,c)
                plot(f(1,1:length(vrmtotal)),pasab)
                title(h)
                xlabel('Frecuenncia en Hz')
                ylabel('Potencia')
                fmediana=medfreq(abs(pasab),f(1,1:length(pasab)));
                hold on
                plot([fmediana fmediana], ylim, '-r', 'LineWidth',1)  
            else
                subplot(3,2,c)
                plot(f,pasab(1:length(f),1))
                title(h)
                xlabel('Frecuenncia en Hz')
                ylabel('Potencia')
                fmediana=medfreq(abs(pasab(1:length(f),1)),f);
                hold on
                plot([fmediana fmediana], ylim, '-r', 'LineWidth',1) 
            end
           
       end
        %se saca la frecuencia mediana //tal vez toca cambiarlo  
        fmediana2(h)=fmediana;
      
        if  h==1
            fmenor=fmediana2(h);
        elseif  fmenor<fmediana2(h)  
            fmenor=fmenor;
        else
            fmenor=fmediana2(h);
             puntoh=h;
        end
     
end
disp('La menor frecuencia mediana esta en el txt')
disp(puntoh)
%SEÑAL CON FATIGA 
figure(3)
signal2=load([BaseFile num2str(puntoh) '.dat']);
t=0:Tm:length(signal2)*Tm-Tm;
%señal normal
subplot(3,1,1);
plot (t,signal2)
title ('Señal con FATIGA')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')
%FOURIER
L2 = length(signal2); 
sf2=fft(signal2);
p22=abs(sf2/L2);
p12 = p22(1:L2/2+1);
p12(2:end-1) = 2*p12(2:end-1);                 
f2= Fm*(0:(L2/2))/L2; 
f = Fm*(0:(L2/2))/L2;  
subplot(3,1,2);
plot(f2,p12,'c') %  Graficamos la transformada de Fourier
xlabel('Frecuenncia en Hz')
ylabel('Potencia')
% VENTANAS
tamavent=60;
cont=1;
multiplo=1;
for j=tamavent:tamavent:length(p12)
    suma=sum(p12(cont:j).^2);
    Vrms=sqrt((1/length(p12(cont:j)))*suma);
    vrmtotal(cont:j,1)= Vrms; 
    cont=multiplo*tamavent;
    multiplo=multiplo+1;
end
pasab2=filter(Num,1,vrmtotal);
if length(vrmtotal)<length(f)
    subplot(3,1,2)
    hold on;
    plot(f(1,1:length(vrmtotal)),vrmtotal,'r')
    legend('Fourier','Envolvente sin-filtro')
    subplot(3,1,3)
    plot(f(1,1:length(vrmtotal)),pasab2)
    xlabel('Frecuenncia en Hz')
    ylabel('Potencia')
    %marcar la frecuencia mediana 
    hold on
    plot([fmediana2(puntoh) fmediana2(puntoh)], ylim, '-g', 'LineWidth',1) 
    legend('Envolvente con-filtro','Frecuencia Mediana')
else
    subplot(3,1,2)
    hold on;
    plot(f,vrmtotal(1:length(f),1),'r')
    legend('Fourier','Envolvente sin filtro')
    subplot(3,1,3)
    plot(f,pasab2(1:length(f),1))
    xlabel('Frecuenncia en Hz')
    ylabel('Potencia')
    hold on
    plot([fmediana2(puntoh) fmediana2(puntoh)], ylim, '-g', 'LineWidth',1) 
    legend('Envolvente con-filtro','Frecuencia Mediana')
end


 




