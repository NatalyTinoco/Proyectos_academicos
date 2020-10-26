function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 16-Jul-2018 12:03:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bombillo.
function bombillo_Callback(hObject, eventdata, handles)
% hObject    handle to bombillo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bombillo


% --- Executes on selection change in opciones.
function opciones_Callback(hObject, eventdata, handles)
% hObject    handle to opciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns opciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from opciones


% --- Executes during object creation, after setting all properties.
function opciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to opciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function texto_Callback(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of texto as text
%        str2double(get(hObject,'String')) returns contents of texto as a double


% --- Executes during object creation, after setting all properties.
function texto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in comenzar.
function comenzar_Callback(hObject, eventdata, handles)

% hObject    handle to comenzar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
val= get(handles.opciones,'Value');
switch val
case 1
    set(handles.axes3,'visible','off') %hide the current axes
    set(handles.axes4,'visible','off') 
    set(handles.axes5,'visible','off') 
    set(handles.axes2,'visible','on') 
% abrir la señal
signal=load('emg.txt');
% frecuencia y tiempo de muestreo
Fm=1000;
Tm=1/Fm;
t=0:Tm:length(signal)*Tm-Tm;
tamavent=60;
actividadreferencia=tamavent*20;
cont=actividadreferencia;
contador=actividadreferencia+tamavent;
for j= 1:length(signal)-1
%subplot(2,1,1);
hold on;
plot(t(1:j+1),signal(1:j+1),'c') 
pause(0.001)
cosegnal=signal(1:j+1,1);        
    if length(cosegnal)==actividadreferencia
        VRMS=sqrt((1/length(cosegnal(1:actividadreferencia)))*sum(cosegnal(1:actividadreferencia).^2)); 
        vrmtotal(1:actividadreferencia,1)= VRMS; 
        resta=mean(vrmtotal); 
%         promedio=mean(cosegnal(1:actividadreferencia));
%         hold on
%         plot(t(1,1:actividadreferencia),vrmtotal(1:actividadreferencia,1),'b')
    elseif length(cosegnal)>actividadreferencia
         if length(cosegnal)== contador 
            signalrectificada=abs(cosegnal-resta);
            VRMS=sqrt((1/length(signalrectificada(cont:contador)))*sum(signalrectificada(cont:contador).^2)); 
            vrmtotal1(cont:contador,1)= VRMS;    
            [Num,Den] = butter(1,0.006,'low'); 
            %[Num,Den] = butter(1,10/(Fm/2),'low');
            hold on
            signalenvolvente = filtfilt (Num,Den,vrmtotal1+resta);
            plot(t(1,cont-(tamavent/2):contador),signalenvolvente(cont-(tamavent/2):contador,1),'b');
            
            if mean(signalenvolvente(cont:contador))>= (0.18*resta)+resta
                v(cont:contador,1)=(0.8*resta)+resta;
                mitexto='Activación muscular';
                set(handles.texto,'string',mitexto);
            else
                v(cont:contador,1)=resta*0.9;
                mitexto=' ';
                set(handles.texto,'string',mitexto);
            end 
            hold on;
            plot(t(1,cont-1:contador),v(cont-1:contador,1),'r');
            cont=tamavent+cont;
            contador=tamavent+contador;                   
         end
    end    
end

plot(t(1,1:length(signalenvolvente)),signalenvolvente,'b');
            

      global v
case 2
    set(handles.axes2,'visible','off') 
    set(handles.axes3,'visible','on') 
    set(handles.axes4,'visible','on') 
    set(handles.axes5,'visible','on') 
    v=0;
     mitexto='OPRIMA EL BOTON [>] ';
     set(handles.texto,'string',mitexto);
case 3
     set(handles.axes2,'visible','off') 
    set(handles.axes3,'visible','on') 
    set(handles.axes4,'visible','on') 
    set(handles.axes5,'visible','on') 
    v=0;
     mitexto='OPRIMA EL BOTON [>] ';
     set(handles.texto,'string',mitexto);
case 4
    set(handles.axes2,'visible','off') 
    set(handles.axes3,'visible','on') 
    set(handles.axes4,'visible','on') 
    set(handles.axes5,'visible','on') 
    v=0;
     mitexto='OPRIMA EL BOTON [>] ';
     set(handles.texto,'string',mitexto);
end


% --- Executes on button press in limpiar.
function limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global v
axes(handles.axes2);
cla
axes(handles.axes3);
cla
axes(handles.axes4);
cla
axes(handles.axes5);
cla
v=0;


% --- Executes on button press in cerrar.
function cerrar_Callback(hObject, eventdata, handles)
% hObject    handle to cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global v
v=0;
close all
clear all
clc


% --- Executes on button press in siguiente.
function siguiente_Callback(hObject, eventdata, handles)
% hObject    handle to siguiente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global  v  BaseFile;
 v=v+1;
 if v>=14
     v=14;
 end
 h=v;
val= get(handles.opciones,'Value');
if val==2
   BaseFile = 'c';
%for h=1:cantidad
    signal=load([BaseFile num2str(h) '.dat']);
    % frecuencia y tiempo de muestreo
    Fm=1024;
    Tm=1/Fm;
    t=0:Tm:length(signal)*Tm-Tm;
    %figure (h)
    axes(handles.axes3);
    cla;
    plot(t,signal)
    %pwelch
    %[P,F]=pwelch(signal,hamming(length(signal)),[100],Fm+6,Fm);
    %plot(F,P,'b')
    % %FOURIER
    L = length(signal); 
    sf=fft(signal);
    p2=abs(sf/L);
    P = p2(1:L/2+1);
    P(2:end-1) = 2*P(2:end-1);                 
    F= Fm*(0:(L/2))/L;  
    axes(handles.axes4);
    cla;
    plot(F,P,'c')

    % VENTANAS
    tamavent=90;
    cont=1;
    multiplo=1;
    for j=tamavent:tamavent:length(P)+1
        VRMS=sqrt((1/length(P(cont:j)))*sum(P(cont:j).^2)); 
        vrmtotal(cont:j,1)= VRMS; 
        cont=multiplo*tamavent;
        multiplo=multiplo+1;  
    end
    [Num,Den] = butter(1,0.005,'low');
    %[Num,Den] = butter(1,fm/2,'low');
    pasab = filtfilt (Num,Den,vrmtotal);
    global fmediana2 
%graficar todas
    if length(vrmtotal)<length(F)
        axes(handles.axes5);
        cla;
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
%         hold on;
%         plot(F(1,1:length(u)),u,'r') 
        fmediana=medfreq(abs(pasab),F(1,1:length(pasab)));
        hold on
        plot([fmediana fmediana], ylim, '-r', 'LineWidth',1)  
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
       
    else
        axes(handles.axes5);
        cla;
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
        hold on;
%       plot(F,u(1,1:length(F)),'r') 
        fmediana=medfreq(abs(pasab(1:length(F),1)),F);
        hold on
        plot([fmediana fmediana], ylim, '-r', 'LineWidth',1) 
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
      
    end 
    
    fmediana2(v)=fmediana;   
    
if v==14
    
    for m=1:14
         if  m==1
            fmenor=fmediana2(m);
        elseif  fmenor<fmediana2(m)  
            fmenor=fmenor;
        else
            fmenor=fmediana2(m);
             puntoh=m;
         end
    end

%for h=1:cantidad
    signal=load([BaseFile num2str(puntoh) '.dat']);
    % frecuencia y tiempo de muestreo
    Fm=1024;
    Tm=1/Fm;
    t=0:Tm:length(signal)*Tm-Tm;
    %figure (h)
    title('SEÑAL CON FATIGA')
    axes(handles.axes3);
    cla;
    plot(t,signal)
    % %FOURIER
    L = length(signal); 
    sf=fft(signal);
    p2=abs(sf/L);
    P = p2(1:L/2+1);
    P(2:end-1) = 2*P(2:end-1);                 
    F= Fm*(0:(L/2))/L;  
    axes(handles.axes4);
    cla;
    plot(F,P,'c')

    % VENTANAS
    tamavent=90;
    cont=1;
    multiplo=1;
    for j=tamavent:tamavent:length(P)+1
        VRMS=sqrt((1/length(P(cont:j)))*sum(P(cont:j).^2)); 
        vrmtotal(cont:j,1)= VRMS; 
        cont=multiplo*tamavent;
        multiplo=multiplo+1;  
    end
    [Num,Den] = butter(1,0.005,'low');
    %[Num,Den] = butter(1,fm/2,'low');
    pasab = filtfilt (Num,Den,vrmtotal);
%graficar todas
    if length(vrmtotal)<length(F)
        axes(handles.axes5);
        cla;
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
%         hold on;
%         plot(F(1,1:length(u)),u,'r') 
        fmediana=medfreq(abs(pasab),F(1,1:length(pasab)));
        hold on
        plot([fmediana fmediana], ylim, '-r', 'LineWidth',1)  
        title('SEÑAL CON FATIGA')      
    else
        axes(handles.axes5);
        cla;
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
        hold on;
%       plot(F,u(1,1:length(F)),'r') 
        fmediana=medfreq(abs(pasab(1:length(F),1)),F);
        hold on
        plot([fmediana fmediana], ylim, '-r', 'LineWidth',1) 
        title('SEÑAL CON FATIGA')
      
    end
% 
 cl=' ';
 set(handles.texto,'string',cl);
 mitexto='La fatiga se encuentra en el txt:';
 set(handles.texto,'string',mitexto);
  pause (1)
 mitexto2=puntoh;
set(handles.texto,'string',mitexto2);
pause (3)
 mitexto3='Con una frecuencia mediana de:';
 set(handles.texto,'string',mitexto3);
 pause (2)
 mitexto4=fmenor;
 set(handles.texto,'string',mitexto4); 
end    
end

if val==3
       BaseFile = 'c';
%for h=1:cantidad
    signal=load([BaseFile num2str(h) '.dat']);
    % frecuencia y tiempo de muestreo
    Fm=1024;
    Tm=1/Fm;
    t=0:Tm:length(signal)*Tm-Tm;
    %figure (h)
    axes(handles.axes3);
    cla;
    plot(t,signal)
    %pwelch
    %[P,F]=pwelch(signal,hamming(length(signal)),[100],Fm+6,Fm);
    %plot(F,P,'b')
    % %FOURIER
    L = length(signal); 
    sf=fft(signal);
    p2=abs(sf/L);
    P = p2(1:L/2+1);
    P(2:end-1) = 2*P(2:end-1);                 
    F= Fm*(0:(L/2))/L;  
    axes(handles.axes4);
    cla;
    plot(F,P,'c')

    % VENTANAS
    tamavent=90;
    cont=1;
    multiplo=1;
    for j=tamavent:tamavent:length(P)+1
        VRMS=sqrt((1/length(P(cont:j)))*sum(P(cont:j).^2)); 
        vrmtotal(cont:j,1)= VRMS; 
        cont=multiplo*tamavent;
        multiplo=multiplo+1;  
    end
    [Num,Den] = butter(1,0.005,'low');
    %[Num,Den] = butter(1,fm/2,'low');
    pasab = filtfilt (Num,Den,vrmtotal);
    %picodefrecuencia
    %range
    global oblicuedad
    %oblicuedad de una curva
    oblicuedad(h)=skewness(pasab);
    
%graficar todas
    if length(vrmtotal)<length(F)
        axes(handles.axes5);
        cla;
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
%         hold on;
%         plot(F(1,1:length(u)),u,'r') 
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
       
    else
        axes(handles.axes5);
        cla;
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
        hold on;
%       plot(F,u(1,1:length(F)),'r') 
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
      
    end 

if v==14
    
    for m=1:14
        if  m==1
            omayor=oblicuedad(m);
        elseif  omayor>oblicuedad(m)  
            omayor=omayor;
        else
            omayor=oblicuedad(m);
             puntoh=m;
        end
    end
    

%for h=1:cantidad
    signal=load([BaseFile num2str(puntoh) '.dat']);
    % frecuencia y tiempo de muestreo
    Fm=1024;
    Tm=1/Fm;
    t=0:Tm:length(signal)*Tm-Tm;
    %figure (h)
    title('SEÑAL CON FATIGA')
    axes(handles.axes3);
    cla;
    plot(t,signal)
    % %FOURIER
    L = length(signal); 
    sf=fft(signal);
    p2=abs(sf/L);
    P = p2(1:L/2+1);
    P(2:end-1) = 2*P(2:end-1);                 
    F= Fm*(0:(L/2))/L;  
    axes(handles.axes4);
    cla;
    plot(F,P,'c')

    % VENTANAS
    tamavent=90;
    cont=1;
    multiplo=1;
    for j=tamavent:tamavent:length(P)+1
        VRMS=sqrt((1/length(P(cont:j)))*sum(P(cont:j).^2)); 
        vrmtotal(cont:j,1)= VRMS; 
        cont=multiplo*tamavent;
        multiplo=multiplo+1;  
    end
    [Num,Den] = butter(1,0.005,'low');
    %[Num,Den] = butter(1,fm/2,'low');
    pasab = filtfilt (Num,Den,vrmtotal);
%graficar todas
    if length(vrmtotal)<length(F)
        axes(handles.axes5);
        cla;
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
%         hold on;
%         plot(F(1,1:length(u)),u,'r') 
        fmediana=medfreq(abs(pasab),F(1,1:length(pasab)));
        hold on
        plot([fmediana fmediana], ylim, '-r', 'LineWidth',1)  
        title('SEÑAL CON FATIGA')      
    else
        axes(handles.axes5);
        cla;
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
        hold on;
%       plot(F,u(1,1:length(F)),'r') 
        fmediana=medfreq(abs(pasab(1:length(F),1)),F);
        hold on
        plot([fmediana fmediana], ylim, '-r', 'LineWidth',1) 
        title('SEÑAL CON FATIGA')
      
    end
% 
 cl=' ';
 set(handles.texto,'string',cl);
 mitexto='La fatiga se encuentra en el txt:';
 set(handles.texto,'string',mitexto);
  pause (1)
 mitexto2=puntoh;
set(handles.texto,'string',mitexto2);
pause (3)
 mitexto3='Con oblicuedad de:';
 set(handles.texto,'string',mitexto3);
 pause (2)
 mitexto4=omenor;
 set(handles.texto,'string',mitexto4); 
end
end

if val==4
 BaseFile = 'c';
%for h=1:cantidad
    signal=load([BaseFile num2str(h) '.dat']);
    % frecuencia y tiempo de muestreo
    Fm=1024;
    Tm=1/Fm;
    t=0:Tm:length(signal)*Tm-Tm;
    %figure (h)
    axes(handles.axes3);
    cla;
    plot(t,signal)
    % %FOURIER
    L = length(signal); 
    sf=fft(signal);
    p2=abs(sf/L);
    P = p2(1:L/2+1);
    P(2:end-1) = 2*P(2:end-1);                 
    F= Fm*(0:(L/2))/L;  
    axes(handles.axes4);
    cla;
    plot(F,P,'c')

    % VENTANAS
    tamavent=90;
    cont=1;
    multiplo=1;
    for j=tamavent:tamavent:length(P)+1
        VRMS=sqrt((1/length(P(cont:j)))*sum(P(cont:j).^2)); 
        vrmtotal(cont:j,1)= VRMS; 
        cont=multiplo*tamavent;
        multiplo=multiplo+1;  
    end
    [Num,Den] = butter(1,0.005,'low');
    %[Num,Den] = butter(1,fm/2,'low');
    pasab = filtfilt (Num,Den,vrmtotal);
     %picodefrecuencia
    %range

[valorp, ubicp] = findpeaks(pasab,'sortstr','descend');
k=1;
  for i=1:length(pasab)
  if pasab(i)>= valorp(1,1)/2
    u(1:length(F))=pasab(i);  
    m(k)=i;
    k=k+1;
  end
  end

%graficar todas
    if length(vrmtotal)<length(F)
        axes(handles.axes5);
        cla;
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
%         hold on;
       plot(F(1,1:length(u)),u,'r') 
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
       
    else
        axes(handles.axes5);
        cla;
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
        hold on;
        plot(F,u(1,1:length(F)),'r') 
        title(h)
        xlabel('Frecuenncia en Hz')
        ylabel('Potencia')
      
    end
 
    hold on;
%plot(F(min(m)),pasab(min(m)),'*g')
global distancia
hold on;
[minimo,position]=min(abs(pasab-valorp(1,1)/2));
mas_cercano=pasab(position);
plot(F(ubicp(1,1)),(pasab(ubicp(1,1))/2),'*g')
hold on;
if v~=9
 plot(F(position),pasab(position),'*g')
distancia(v)=sqrt((F(position)-F(ubicp(1,1)))^2 + (pasab(position)-(pasab(ubicp(1,1))/2))^2);
else
   plot(F(1),pasab(1),'*g')
  distancia(v)=sqrt((F(1)-F(ubicp(1,1)))^2 + (pasab(1)-(pasab(ubicp(1,1))/2))^2);
end
        
if v==14
    
    for m=1:14
         
    if  m==1
        dmenor=distancia(m);
    elseif  dmenor>distancia(m)  
        dmenor=dmenor;
    else
        dmenor=distancia(m);
        puntot=m;
    end
    
    end

%for h=1:cantidad
    signal=load([BaseFile num2str(puntot) '.dat']);
    % frecuencia y tiempo de muestreo
    Fm=1024;
    Tm=1/Fm;
    t=0:Tm:length(signal)*Tm-Tm;
    %figure (h)
    title('SEÑAL CON FATIGA')
    axes(handles.axes3);
    cla;
    plot(t,signal)
    % %FOURIER
    L = length(signal); 
    sf=fft(signal);
    p2=abs(sf/L);
    P = p2(1:L/2+1);
    P(2:end-1) = 2*P(2:end-1);                 
    F= Fm*(0:(L/2))/L;  
    axes(handles.axes4);
    cla;
    plot(F,P,'c')

    % VENTANAS
    tamavent=90;
    cont=1;
    multiplo=1;
    for j=tamavent:tamavent:length(P)+1
        VRMS=sqrt((1/length(P(cont:j)))*sum(P(cont:j).^2)); 
        vrmtotal(cont:j,1)= VRMS; 
        cont=multiplo*tamavent;
        multiplo=multiplo+1;  
    end
    [Num,Den] = butter(1,0.005,'low');
    %[Num,Den] = butter(1,fm/2,'low');
    pasab = filtfilt (Num,Den,vrmtotal);
%graficar todas
    if length(vrmtotal)<length(F)
        axes(handles.axes5);
        cla;
        hold on
        plot(F(1,1:length(vrmtotal)),vrmtotal,'b')
        hold on
        plot(F(1,1:length(pasab)),pasab,'r')
%         hold on;
       plot(F(1,1:length(u)),u,'r') 
        title('SEÑAL CON FATIGA')      
    else
        axes(handles.axes5);
        cla;
        hold on
        plot(F,vrmtotal(1:length(F),1),'b')
        hold on
        plot(F,pasab(1:length(F),1),'r')
        hold on;
        plot(F,u(1,1:length(F)),'r') 
        title('SEÑAL CON FATIGA')
      
    end
% 
 cl=' ';
 set(handles.texto,'string',cl);
 mitexto='La fatiga se encuentra en el txt:';
 set(handles.texto,'string',mitexto);
  pause (1)
 mitexto2=puntot;
set(handles.texto,'string',mitexto2);
pause (3)
 mitexto3='Distancia de:';
 set(handles.texto,'string',mitexto3);
 pause (2)
 mitexto4=dmenor;
 set(handles.texto,'string',mitexto4); 
end    
end    
