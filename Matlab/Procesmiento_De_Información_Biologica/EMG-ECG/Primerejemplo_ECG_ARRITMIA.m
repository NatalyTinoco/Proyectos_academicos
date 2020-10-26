close all
clear all
signal1=load('ECGClean2.txt');
fm=360; % frecuancia de muestreo
tm=1/fm; % tiempo de muestreo
t=0:tm:length(signal1)*tm-tm; %% tiempo que dura la señal 
fa=10; %frecuencia de la arritmia
x=0:0.09:2*pi;
arritmia=70*sin(2*pi*fa*x)+mean(signal1);
signalf=[signal1' arritmia signal1'];
t1=0:tm:length(signalf)*tm-tm;
%plot(t1,signalf)
for j= 1:length(signalf)-1
    %subplot(2,1,1)
    plot(t1(1:j+1),signalf(1:j+1)) 
    xlabel('Tiempo (ms)');
    ylabel('Amplitud (mV)')
    title('EMG');
    pause(0.01)
end