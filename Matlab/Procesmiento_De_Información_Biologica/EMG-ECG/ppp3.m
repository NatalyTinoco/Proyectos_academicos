clear all
close all
clc

ref=load('ECG158.txt');

signal=load('ECGRA.txt');

%signal=load('ECGPG2.txt');
%con la realización de la gráfica se puede observar que se detecta el ruido
%requerido,sin embargo no se logró desfasar en su totalidad la gráfica de
%referencia para su posterior análisis, por lo que con la primera gráfica
%se detalla un funcionasmiento completo de lo pedido.

Fm=250;
Tm=1/Fm;
tref=0:Tm:length(ref)*Tm-Tm;
tsignal=0:Tm:length(signal)*Tm-Tm;

%plot(tref,ref)

tamavent=20;
cont=1;
contador=tamavent;
multiplo=1;
covaf=0;
covas=0;
multiplir=zeros(length(tamavent),1);
desrx=zeros(length(tamavent),1);
desry=zeros(length(tamavent),1);
signalrefe=[ref;ref;ref;ref;ref];
%signalrefe=[ref(63.5:length(ref),1);ref;ref;ref;ref];
treff=0:Tm:length(signalrefe)*Tm-Tm;
%grafica dinamica
for h= 1:length(signal)-1
%     subplot(2,1,1)
    plot(tsignal(1:h+1),signal(1:h+1)) 
    xlabel('Tiempo (ms)');
    ylabel('Amplitud (mV)')
    title('EMG');
    pause(0.01)
    %señal ventana
%     subplot(2,1,2)
    hold on;
    plot(treff(1:h+1),signalrefe(1:h+1),'r') 
    xlabel('Tiempo (ms)');
    ylabel('Amplitud (mV)')
    title('EMG');
    pause(0.01)
    cosegnal=signal((1:h+1));
    if length(cosegnal)==contador
        %for j=tamavent:tamavent:length(signal)
            %media por ventana señal referencia
               %media
             mediarefy=mean(signalrefe(cont:contador,1));
             mediarefx=mean(signal(cont:contador,1));
             tre=signal(cont:contador,1);
             reff=signalrefe(cont:contador,1);
             covaf=sum((tre-mediarefx).*(reff-mediarefy))/(length(reff)-1);
             %desviaciónx
             da1=sum((tre-mediarefx).^2);
             desvx=sqrt((1/(length(tre)-1))*da1);
             %desviacióny
             da2=sum((reff-mediarefy).^2);
             desvy=sqrt((1/(length(reff)-1))*da2);
             %coeficiente
             coeref=(covaf/(desvx*desvy));
            %se pone 0.9 debido a que matlab arroja algunos casos valores
            %decimales ej: 1.000
            if abs(coeref)<0.9
                beep
                beep on
                disp('detectado')
            end
            cont=multiplo*tamavent;
            multiplo=multiplo+1;
            contador=multiplo*tamavent;
    end
    %end
end