%Fatima Mary Rocha Ruiz, Hemer Camilo Polania Perez, Paula Andres Barrero
%Bareno, Gunnar Alejandro Avendano Predraza
%Bioinstrumentacion con Matlab y Labview
%2015-2
%Aqui comienza el desarrollo del reto 5 y 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%El siguiente codigo (reto 5 y 6) esta pensado para el realizar la lectura de 3 sensores (en nuestro caso: 
% Un sensor de temperatuta lm-35, sensor de humedad y temperatura DHT11,
% sensor de gas MQ-2, esta lectura sera presentada en una matriz y en grafica lectura vs tiempo...
% Una vez se realiza la lectura de los datos son redirigidos al programa de
% labview y posteriormete enviados a una red social la cual funciona como
% una especie de twitter, en el cual los ensre uegan el papel de usuarios y
% pueden ser etiquetados para que muestren su valor o pueden ser llamados y
% presentaran el dato que estan leyendo...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%En el siguiente fragmento de codigo se realiza la coneccion con el
%dispositivo arduino en el cual estan conectados los sensores...
a=arduino('COM3');
%%
%en esta parte del codigo se establece la conexion entre el programa de
%matlab y el programa de labview
number_of_retries = -1; % se fija en -1 para que el puerto pue la cual comezara a almacenar datos cada 30 segundos de inercambiar un numero infinito de datos 
port=2057; % This code use for communication "port" and "port+1"
host='localhost';   
samplingrate=1000; 
% Aqui se presenta la matriz datos sensores, ademas se inicializa la variable 
w=0; %se inicializa la variable en 0 para que ingrese al while
senshume={'fecha';'medida'};
senstemp={'fecha';'medida'};
sensgas={'fecha';'medida'};
% los sensores seran leidos cada 30 segundos
tiempo=30;
while w==0
 fecha=clock;% con esta varible aseguramos que los
 fechas=sprintf('%d/%d/%d/,%d:%d',fecha(1),fecha(2),fecha(3),fecha(4),fecha(5));   
 %humedad
    sensorhum=a.analogRead(0);% se lee el voltage enviado por el sensor a traves del arduino, por el puerto A0
    sensorhum=(5.0 * sensorhum * 100.0)/1024.0;% se realiza la conversion del voltage % de humedad relativa
    sensorhum=(sensorhum - 0.958)/0.0307;
    mathum={(fecha);(sensorhum)};
    senshume=[senshume mathum];
    math= senshume.'
 %temperatura
    sensortem=a.analogRead(1);% se lee el voltage enviado por el sensor a traves del arduino, por el puerto A1
    sensortem=(5.0 * sensortem * 100.0)/1024.0;% se realiza la conversion de voltaje a grados celsius
    mattemp={(fecha);(sensortem)};
    senstemp=[senstemp mattemp];
    matt= senstemp.' 
 %gas
    sensorgas=a.analogRead(2);% se lee el voltage enviado por el sensor a traves del arduino, por el puerto A2
    sensorgas=sensorgas/1024*5.0;% se realiza a conversion de voltaje a ppm
    matgas={(fecha);(sensorgas)};      
    sensgas=[sensgas matgas];
    matg= sensgas.'
    %%%%%%%%%%%%
    data_to_send=['|',regexprep(num2str(sensortem),'\.',','),'|',regexprep(num2str(sensortem),'\.',',')];
    data_received=exchangeData(port,host,number_of_retries,samplingrate,data_to_send)
    if(numel(data_received)>0 )
      
      % tiempo=tiempo+30;
 %graficas     
 
    pause(2)
    
    end
end
