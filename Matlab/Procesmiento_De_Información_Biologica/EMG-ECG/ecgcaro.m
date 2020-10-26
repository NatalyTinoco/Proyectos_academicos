clear all
close all
clc

% abrir la señal
ECG=load('ECGClean1.txt');

% frecuencia y tiempo de muestreo
Fm=360;
Tm=1/Fm;
t=0:Tm:length(ECG)*Tm-Tm;

%señal normal
subplot(3,1,1);
plot (t,ECG)
xlabel('Tiempo (s)')
ylabel('Amplitud (V)')

%ventaneo, no tiempo real, una ventana recorre la señal
tamavent=92;
desvholo=0;
desvtotal=0;
cont=1;
multiplo=1;

for j=tamavent:tamavent:length(ECG)+1
    %desviación estándar por ventana
    x=mean(ECG(cont:j));
    da1=sum(ECG(j,1)-x)^2;
    desv=sqrt((1/(length(ECG(cont:j))-1))*da1);
    cont=multiplo*tamavent;
    desvtotal((cont/tamavent),1)= desv; 
    multiplo=multiplo+1;
end

%comparar vector de desv de c/ventana y dejar mayor
n=length(desvtotal);
vecti=zeros(11,1);
sumi=0;
for p=1:n
  if desvtotal(p)>sumi
      sumi=desvtotal(p);
  else
     sumi;
  end  
end 
subplot(3,1,2)
plot(t(1,1:length(desvtotal)),desvtotal,'r')
fin=9.57*sumi;
[minimo,position]=min(abs(ECG-fin));
mas_cercano=ECG(position);
%graficar puntos altos en la señal
hold on
subplot(3,1,3)
plot(t(1,1:length(ECG)),ECG,'g',t(position),mas_cercano,'om')



