clear all
close all
clc
BaseFile = 'c';
for h=4:4
    signal=load([BaseFile num2str(h) '.dat']);
        % frecuencia y tiempo de muestreo
        Fm=1024;
        Tm=1/Fm;
        t=0:Tm:length(signal)*Tm-Tm;
        figure(h)
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
        % VENTANAS
        tamavent=60;
        vrmholo=0;
        cont=1;
        multiplo=1;
        for j=tamavent:tamavent:length(p1)
            suma=sum(p1(cont:j).^2);
            Vrms=sqrt((1/length(p1(cont:j)))*suma);
            vrmtotal(cont:j,1)= Vrms; 
            cont=multiplo*tamavent;
            multiplo=multiplo+1;
        end
        subplot(3,1,2)
        plot(f,p1,'c') %  Graficamos la transformada de Fourier
         xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
%          load Num.mat
%         pasab=filter(Num,1,vrmtotal); %% pasa bajas
[Num,Den] = butter(1,0.009,'low'); 
pasab = filtfilt (Num,Den,vrmtotal);

        if length(vrmtotal)<length(f)
            subplot(3,1,2)
            hold on;
            plot(f(1,1:length(vrmtotal)),vrmtotal,'r')
            legend('Fourier','Envolvente sin-filtro')
            subplot(3,1,3)
            plot(f(1,1:length(vrmtotal)),pasab)
            xlabel('Frecuenncia en Hz')
            ylabel('Potencia')
        else
            subplot(3,1,2)
            hold on;
            plot(f,vrmtotal(1:length(f),1),'r')
            legend('Fourier','Envolvente sin filtro')
            subplot(3,1,3)
            plot(f,pasab(1:length(f),1))
            xlabel('Frecuenncia en Hz')
            ylabel('Potencia')
        end
        %se saca la frecuencia mediana //tal vez toca cambiarlo 
        %CumAmp = cumtrapz(f(1,1:length(pasab)), abs(pasab));                    % Integrate FFT Amplitude
        %MedFreq = interp1(CumAmp, f(1,1:length(pasab)), CumAmp(end)/2);           % Use ‘interp1’ To Find ‘MF’
        MedFreq=medfreq(abs(pasab),f(1,1:length(pasab)));
        hold on
        plot([MedFreq MedFreq], ylim, '-r', 'LineWidth',1)      % Plot Median Frequency
        fmediana(h)=median(pasab);
      if h>1
        if fmediana(h-1)<fmediana(h)
            fmenor=fmediana(h-1);
        else
            fmenor=fmediana(h);
             puntoh=h;
        end
      end
end
%disp('La menor frecuencia mediana esta en el txt')
%disp(puntoh)