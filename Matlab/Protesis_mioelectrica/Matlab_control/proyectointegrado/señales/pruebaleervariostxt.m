% Reset your memory and clear your screen
clc;
clear all; 
% Provide base file name and number of files to be read
BaseFile = 'movimiento';
n = 130; 
conta=1;
for i = 50 : n
    % Open consecutively each of the remaining files
    d(i) = fopen([BaseFile num2str(i) '.txt']);
    n1=1;
        while ~feof(d(i))
        leer_linea = fgetl(d(i));
        if isempty(leer_linea) || ~ischar(leer_linea)
         break
        end
        C(n1)= cellstr(leer_linea);
        n1=n1+1;
        end
    fclose(d(i));   
   % C=C';
    

    mi_matrix( 1:160,conta)=C';
          
    conta=1+conta;
  
%disp(C);
% Transform your cell array into an ordinary matrix 
% and show your data
% my_data = cell2mat(R)
end
  n2=1;
  suma=0;
for k=1:n
   signal=zeros(160,1);
        for m=1:160
            signal(m,1)=str2num(mi_matrix{m,k});
            %%volver a tomar la 5, 6, 14 del primer mov
        end  
     promedio=median(signal);  
    %QUITAR OFSET    
    signal1=zeros(length(signal),1);
    for i=1:length(signal)
    signal1(i,1)=signal(i,1)-promedio;
    end  
    %PROMEDIO SE—AL SIN FILTROS
 
  % valormedio=mean(signal1); 
   %moda=mode(signal1);
   desviacion=std(signal1,1); 
   %varianza=var(signal1,1);
   valores_propios=eig(signal1); 
   
   
   % NORMALIZAR
    signal1=signal1/norm(signal1);
    promedio1=median(signal1);
    
  % FILTROS
    load Num.mat
    load Not.mat
    pasa=filter(Num,signal); %% pasa bandas 
    notch=filter(Not,pasa);

    subplot(2,1,1);
    plot(signal,'r')
    
    %%promedio1=median(notch);
    
    %FOURIER
    Fs = 1000;             % Frecuencia de toma de muestras de la se√±al s  % (este valor puede variar)
    T = 1/Fs;              % Tiempo entre la toma de una muestra y la siguiente
    L = 160;               % Cantidad de muestras que queremos tomar
    t1 = (0:L-1)*T;        % Creamos un vector de tiempo
    y=fft(notch);
    p2=abs(y/L);
    p1 = p2(1:L/2+1);
    p1(2:end-1) = 2*p1(2:end-1);                 
    f = Fs*(0:(L/2))/L;  
    %ny=20*log(p1);
    ny=p1;
    %figure,
    subplot(2,1,2);
    plot(f,ny,'r') %  Graficamos la transformada de Fourier
    xlabel('Frecuenncia en Hz')
    ylabel('Potencia')

    caracteristicas(1,n2)=promedio;
    %caracteristicas(2,n2)=valormedio;
    %caracteristicas(3,n2)=moda;
     %caracteristicas(4,n2)=varianza;
    caracteristicas(2,n2)=desviacion;
    caracteristicas(3,n2)=rms;
    %matriz=zeros(2,20);
    n2=n2+1;

    %matriz(1,n)=promedio;
    %matriz(2,n)=promedio1;
 
end
disp(caracteristicas)

