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
tamavent=10;
desvholo=0;
desvtotal=0;
cont=1;
multiplo=1;
p=1;
sumi=0;
for j=tamavent:tamavent:length(ECG)+1
    %desviación estándar por ventana
    x=median(ECG(cont:j));
    da1=sum(ECG(j,1)-x)^2;
    desv=sqrt((1/(length(ECG(cont:j))-1))*da1);
    desvtotal(cont,1)= desv; 
    cont=multiplo*tamavent;
    multiplo=multiplo+1;
    %media=median(desvtotal);
    %med(cont,1)=media;
    
    %comparar vector de desv de c/ventana y dejar mayor
    %n=length(desvtotal);
    %while p<=n
        %if desvtotal(p)>sumi
            %sumi=desvtotal(p); 
        %else
            %sumi;
        %end  
    %end 
end

%comparar vector de desv de c/ventana y dejar mayor
n=length(desvtotal);
while p<=n
  if desvtotal(p)>sumi
     sumi=desvtotal(p); 
  else
     sumi;
  end  
end 
  
%graficar puntos altos en la señal
%pks = findpeaks(desvtotal)
hold on;
subplot(3,1,2)
plot(t(1,1:length(desvtotal)),desvtotal,'r')