clear all
close all
clc

% abrir la señal
EEG=load('EEG.txt');

% frecuencia y tiempo de muestreo
Fm=250;
Tm=1/Fm;
t=0:Tm:length(EEG)*Tm-Tm;
%res=Fm/3840;

%señal normal
figure (1)
subplot(2,1,1);
plot (t,EEG)
title('SEÑAL EEG')
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')

%welch
[P,F]=pwelch(EEG,hamming(length(EEG)),[20],256,250);
subplot(2,1,2);
plot(F,P,'r')
title('TRANS.FOURIER EEG')
xlabel('Frecuencia (Hz)')
ylabel('Potencia')

%selección y conteo ritmos
%delta=1-3
%theta=4-7
%alfa=8-12
%beta=>13

%resinicial=((0)/3840)+1;
%resfinal=double((3)/length(EEG))+1;
%r=double(res);

Fritmos=[3,7,12,F(length(F))];
f=F(2)-F(1);
v=1;
for i=1:length(Fritmos)%terminos resolucion
    reso=(Fritmos(i)/f)+1;
    acu(1,i)=sum(P(floor(v):floor(reso)));
    v=((Fritmos(i)+1)/f)+1;
end

%histograma
figure (2)
bar (acu,1,'c')
set(gca,'xticklabel',{'DELTA','THETA','ALFA','BETA'});
title('HISTOGRAMA RITMOS EEG')
xlabel('Ritmo')
ylabel('Cantidad')

%imprimir resultado
 n=length(acu);
 sumi=0;
 for p=1:n
   if acu(p)>sumi
      sumi=acu(p);
  else
     sumi;
  end  
end 

disp('El ritmo con mayor energía es:')
if sumi==acu(1,1)
    disp('Delta')
elseif sumi==acu(1,2)
    disp('Theta')
elseif sumi==acu(1,3)
    disp('Alfa')
elseif sumi==acu(1,4)
    disp('Beta')
end   