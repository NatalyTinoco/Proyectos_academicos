% Captura de voltaje en tiempo real con Arduino
% Jorge García Tíscar

%% Apertura del serie (COM)

%borrar previos
delete(instrfind({'Port'},{'COM5'}));
%crear objeto serie
s = serial('COM5','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);

%% Preparar medida

% parámetros de medidas
tmax = 60; % tiempo de captura en s
%%rate = 30; % resultado experimental (comprobar)

% preparar la figura
f = figure('Name','Captura');
a = axes('XLim',[0 tmax],'YLim',[0 5.1]);
l1 = line(nan,nan,'Color','r','LineWidth',2);

xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
%title('Captura de voltaje en tiempo real con Arduino')
grid on
hold on

%% Bucle
% inicializar
v1 = zeros(1,tmax);

i = 1;
t = 0;

% ejecutar bucle cronometrado
tic
while t<tmax
    t = toc;
    % leer del puerto serie
    a = fscanf(s,'%d')';
    v1(i)=a(1)*5/1024;
    % dibujar en la figura
    x = linspace(0,i/20,i);
    set(l1,'YData',v1(1:i),'XData',x);
    drawnow
    % seguir
    i = i+1;
end
% resultado del cronometro
clc;
fprintf('%g s de captura a %g cap/s \n',t,i/t);

%% Tratamiento

% salvar el gráfico
% necesita la función externa savefigure:
% http://www.mathworks.de/matlabcentral/
% fileexchange/6854-savefigure
% savefigure('captura_multi','s',[4.5 3],'po','-dpdf')

%% Limpiar la escena del crimen

fclose(s);
delete(s);
clear s;