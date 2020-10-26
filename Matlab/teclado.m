clear all;
close all; 
clc;
% teclado
delete(instrfind({'Port'},{'COM5'})); %inicializa el puerto serial
puerto_serial2=serial('COM5');
puerto_serial2.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
fopen(puerto_serial2); %abre el puerto serial

%graficas 
global y x
y=zeros(1,10000); %vectores donde se guardan los datos
x=zeros(1,10000);
delete(instrfind({'Port'},{'COM3'})); %inicializa el puerto serial
puerto_serial=serial('COM3');
puerto_serial.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
fopen(puerto_serial); %abre el puerto serial
contador_muestras=1; 
numero_muestras=10000;

depo={'Teclado'};
c=zeros(1,20);
for i=1:20
depo{1,i}=c(1,i);
end
for i=1:20
   a=fscanf(puerto_serial2,'%d');
   depo{1,i}=a;
   b=char(depo{1,1});
   s1=cellstr(b);
   s2='*';
   tf = strcmp(s1,s2);
   if tf==1
       disp ('Escribe Contraseña')
       if (depo{1,2}==2)&& (depo{1,3}==4)&&(depo{1,4}==9)&&(depo{1,5}==3)          
       disp('clave correcta')
       set(purto_serial2,'DataBits',2);
       set(purto_serial2,'Parity','none');
       set(purto_serial2,'StopBits',1);
       set(purto_serial2,'FlowControl','none');
       fwrite(puerto_serial2,dato,'uint8')
       %grafica
       figure('Name','Serial communication:Matlab + Arduino')
       grid on;
       hold on;

while contador_muestras<=numero_muestras
    subplot(2,1,1)
    xlim([contador_muestras-20 contador_muestras+5])
    valor=fscanf(puerto_serial,'%d,%d');
    y(contador_muestras)=(1023-valor(1));
    plot(contador_muestras,y(contador_muestras),'X-g')
    grid on; hold on;
    title('GRAFICA DE HUMEDAD');
    xlabel('Tiempo');
    ylabel('% Humedad ');
    %TEMPERATURA
    subplot(2,1,2)
    xlim([contador_muestras-20 contador_muestras+5])
    x(contador_muestras)=(valor(2)*5*100)/1024;
    plot(contador_muestras,x(contador_muestras),'X-b')
    grid on; hold on;
    title('GRAFICA DE TEMPERATURA');
    xlabel('Tiempo');
    ylabel('Temperatura (°C)');
    drawnow
    contador_muestras=contador_muestras+1;
end
       elseif (depo{1,5}==3)
           disp('Clave incorrecta')
       end
       
        c=char(depo{1,6});
        s3=cellstr(c);
        s4='#';
        tf = strcmp(s3,s4);
        if tf==1
            disp('Generar archivos')
              disp('clave correcta')
        archivo = fopen('salidatemperatura.txt', 'w');
        fprintf( archivo, '%d /' , x);
        archivo = fopen('salidaHumedad.txt', 'w');
        fprintf( archivo, '%d /' , y);
        end
   end
end
fclose(puerto_serial2);
delete(puerto_serial2);
clear all
