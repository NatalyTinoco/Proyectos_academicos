n=1;
signal=load('movimiento1 - copia (1).txt','w');
%%volver a tomar la 5, 6, 14 del primer mov
%quitar ofset
promedio=median(signal);
signal1=zeros(length(signal),1);
for i=1:length(signal)
    signal1(i,1)=signal(i,1)-promedio;
end
%plot(signal)
%hold on;
plot(signal1,'r')
pasa=filter(Num,signal1); %% pasa bandas 
notch=filter(Not,pasa);
%plot(notch,'g')
promedio1=median(notch);

%FOURIER
Fs = 1000;              % Frecuencia de toma de muestras de la señal s  % (este valor puede variar)
T = 1/Fs;               % Tiempo entre la toma de una muestra y la siguiente
L = 160;               % Cantidad de muestras que queremos tomar
t1 = (0:L-1)*T;          % Creamos un vector de tiempo
y=fft(notch);
p2=abs(y/L);
p1 = p2(1:L/2+1);
p1(2:end-1) = 2*p1(2:end-1);                 
f = Fs*(0:(L/2))/L;  
%ny=20*log(p1);
ny=p1;
%figure,
%plot(f,ny,'r') %  Graficamos la transformada de Fourier
%xlabel('Frecuenncia en Hz')
%ylabel('20Log(||F(w)||)')

matriz=zeros(2,20);

matriz(1,n)=promedio;
matriz(2,n)=promedio1;

