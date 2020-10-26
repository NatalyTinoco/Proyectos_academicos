%LABORATORIO 2-TRANSFORMADAS 2017
%BIOINGENIERÍA-V SEMESTRE


clear all
close all
clc
signal=load('estecorotacion.txt','w');
t=6*(0:size(signal,1)-1);
plot(t(1:length(signal)),signal(1:length(signal)))
xlabel('Tiempo (ms)');
ylabel('Amplitud (V)')

%AQUI IRIA LA FUNCIÓN 1

Fs = 1000;              % Frecuencia de toma de muestras de la seÃ±al s  % (este valor puede variar)
T = 1/Fs;               % Tiempo entre la toma de una muestra y la siguiente
L = 1000;               % Cantidad de muestras que queremos tomar
t1 = (0:L-1)*T;          % Creamos un vector de tiempo

% NFFT=2^nextpow2(L);     % Encontramos el vaalor digital (2^10) mas cercano a L

y=fft(signal);
p2=abs(y/L);
p1 = p2(1:L/2+1);
p1(2:end-1) = 2*p1(2:end-1);                 
f = Fs*(0:(L/2))/L;  
%%ny=20*log(p1);
ny=p1;
figure,
plot(f,ny,'r') %  Graficamos la transformada de Fourier
xlabel('Frecuenncia en Hz')
ylabel('20Log(||F(w)||)')
%luego organizamos de mayor a menor los contenidos de potencia, esto
%permite que tomemos promero las frecuencias con mayor potencia que en
%teorÃ­a son las frecuencias de las seÃ±ales principales

[potenciaY,fdetX]=findpeaks(ny);
npontenciaY=sort(potenciaY,'descend');

for i=1:length(ny)
    if ny(i,1)==npontenciaY(1,1)
       c1=i;
    elseif ny(i,1)==npontenciaY(2,1)
       c2=i;
    elseif ny(i,1)==npontenciaY(3,1)
       c3=i;
    end
end
hold on;
plot(f(c1),npontenciaY(1),'*g',f(c2),npontenciaY(2),'*g',f(c3),npontenciaY(3),'*g')
%máximas potencias 
disp ('LAS MAXIMAS POTENCIAS SE ENCUENTRAN EN LAS FRECUENCIAS:')
disp(f(c3))
disp(f(c1))
disp(f(c2))

%AQUI IRIA OTRA FUNCION }
%%for i=1:length(f)
%if f(1,i)>0
    %ny(1,i)=fft(1);
%elseif f(1,i)<0
%    ny(1,i)=0;
%end
%end
%hold on;
%plot(f,ny,'b') 
