function varargout = arti(varargin)
% ARTI MATLAB code for arti.fig
%      ARTI, by itself, creates a new ARTI or raises the existing
%      singleton*.
%
%      H = ARTI returns the handle to a new ARTI or the handle to
%      the existing singleton*.
%
%      ARTI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARTI.M with the given input arguments.
%
%      ARTI('Property','Value',...) creates a new ARTI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arti_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arti_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arti

% Last Modified by GUIDE v2.5 20-Mar-2018 14:49:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arti_OpeningFcn, ...
                   'gui_OutputFcn',  @arti_OutputFcn, ...
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


% --- Executes just before arti is made visible.
function arti_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to arti (see VARARGIN)

% Choose default command line output for arti
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes arti wait for user response (see UIRESUME)
% uiwait(handles.figure1);

i=imread('as.jpg');
axes(handles.axes1)
image(i)

global puerto_serial 
delete(instrfind({'Port'},{'COM3'})); %inicializa el puerto serial
puerto_serial=serial('COM3');
puerto_serial.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

fopen(puerto_serial); %abre el puerto serial



% --- Outputs from this function are returned to the command line.
function varargout = arti_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global coti coti2 coti3;
coti=0;
coti2=0;
coti3=0;
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cont vect coti;
if coti==0
vect=zeros(4,1);
coti=coti+1;
end
if cont==0
    vect(1,1)=1;
end
if cont==1
    vect(2,1)=1;
end
if cont==2
     vect(3,1)=1;
end
if cont==3
     vect(4,1)=1;
end
 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cont  vect coti;
if coti==0
 vect=zeros(4,1);
coti=coti+1;
end
if cont==0
     vect(1,1)=0;
end
if cont==1
    vect(2,1)=0;
end
if cont==2
    vect(3,1)=0;
end
if cont==3
     vect(4,1)=0;
end
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global angulomax angulomin superior inferior vect puerto_serial angulos 
if angulos==1
     a = fscanf(puerto_serial,'%lf,%lf')';
        angulomax=a(1);
        angulomin=a(2);
  for i=1:1000
    angulomax(i)=a(1);
    angulomin(i)=a(2);
     trocoide=[1,0,0,0];
     artrodia=[0,0,0,0];
     troclear=[0,1,0,0];
     condilea=[0,1,1,1];
     sillademontar=[0,1,1,0];

    if superior==1 && inferior==0
    %codo
      if angulomin(i)<=5 && angulomax(i)>=160
                %humero-cubital
                n=length(vect);
                [cantidad,posicion]=find(vect==troclear);
                ig=length(cantidad);
                xtroclear=ig*100/n;
                %___________
                 [cantidad2,posicion2]=find(vect==trocoide);
                ig2=length(cantidad2);
                xtrocoide=ig2*100/n;
                %_________________
                [cantidad3,posicion3]=find(vect==condilea);
                ig3=length(cantidad3);
                xcondilea=ig3*100/n;

                if xtroclear==100
                mitexto = 'Troclear';
                set(handles.text10,'string',mitexto);
                otro= 'La articulación esta ubicada en el codo, es la articulación Humero-Cubital';
                set(handles.text6,'string',otro);
                %Radio-cubital proximal
                elseif xtrocoide==100
                mitexto = 'Trocoide';
                set(handles.text10,'string',mitexto);
                otro= 'La articulación esta ubicada en el codo, es la articulación Radio-Cubital proximal';
                set(handles.text6,'string',otro);
                %Humero-Radial
                elseif xcondilea==100
                mitexto = 'Condilea';
                set(handles.text10,'string',mitexto);
                otro= 'La articulación esta ubicada en el codo, es la articulación Humero-Radial';
                set(handles.text6,'string',otro);
                else 
                mitexto = 'Error';
                set(handles.text10,'string',mitexto);
                otro= 'No se cuenta con esta información';
                set(handles.text6,'string',otro);  
                end        
    %muñeca 
      elseif angulomin(i)<=85 && angulomax(i)<=85
              %Radio-Carpiana 
              [cantidad3,posicion3]=find(vect==condilea);
                ig3=length(cantidad3);
                xcondilea=ig3*100/n;
              if xcondilea==100
                mitexto = 'Condilea';
                set(handles.text10,'string',mitexto);
                otro= 'La articulación esta ubicada en la muñeca, es la articulación externa de la camara distal y la Radio-Carpiana ';
                set(handles.text6,'string',otro);
              else 
                mitexto = 'Error';
                set(handles.text10,'string',mitexto);
                otro= 'No se cuenta con esta información';
                set(handles.text6,'string',otro);  
              end              
      else 
        mitexto = 'Error';
        set(handles.text10,'string',mitexto);
        otro= 'No se cuenta con esta información';
        set(handles.text6,'string',otro);  
      end
        %___________________________
end
    if superior==0 && inferior==1
    %cadera
        if angulomin(i)<=30 && angulomax(i)>=145        
            %coxofemoral
            n=length(vect);
            [cantidad,posicion]=find(vect==condilea);
            ig=length(cantidad);
            xcondilea=ig*100/n;
          if xcondilea==100
            mitexto = 'Condilea';
            set(handles.text10,'string',mitexto);
            otro= 'La articulación esta ubicada en la cadera, es la articulación Coxofemoral';
            set(handles.text6,'string',otro);
          else 
            mitexto = 'Error';
            set(handles.text10,'string',mitexto);
            otro= 'No se cuenta con esta información';
            set(handles.text6,'string',otro);  
          end
    %rodilla 
      elseif angulomin(i)<=10 && angulomax(i)<=160
            n=length(vect);
            [cantidad,posicion]=find(vect==troclear);
            ig=length(cantidad);
            xtroclear=ig*100/n;
            %__________________
            [cantidad,posicion]=find(vect==condilea);
            ig=length(cantidad);
            xcondilea=ig*100/n;
             %Femoroparetal
            if xtroclear==100
            mitexto = 'Troclear';
            set(handles.text10,'string',mitexto);
            otro= 'La articulación esta ubicada en la rodilla, es la articulación Femoroparetal';
            set(handles.text6,'string',otro);
          %Femorotibial 
            elseif xcondilea==100
            mitexto = 'Condilea';
            set(handles.text10,'string',mitexto);
            otro= 'La articulación esta ubicada en la rodilla, es la articulación Femorotibial';
            set(handles.text6,'string',otro);
            else 
            mitexto = 'Error';
            set(handles.text10,'string',mitexto);
            otro= 'No se cuenta con esta información';
            set(handles.text6,'string',otro);  
            end
    %tobillo 
       elseif angulomin(i)<=30 && angulomax(i)<=50
            n=length(vect);
            [cantidad,posicion]=find(vect==artrodia);
            ig=length(cantidad);
            xartrodia=ig*100/n;
            %__________________
            [cantidad,posicion]=find(vect==troclear);
            ig=length(cantidad);
            xtroclear=ig*100/n;
             %Femoroparetal
          if xartrodia==100
            mitexto = 'Artrodia';
            set(handles.text10,'string',mitexto);
            otro= 'La articulación esta ubicada en el tobillo, es la articulación Tibioperonea proximal ';
            set(handles.text6,'string',otro);
          %Femorotibial 
          elseif xtroclear==100
            mitexto = 'Troclear';
            set(handles.text10,'string',mitexto);
            otro= 'La articulación esta ubicada en el tobillo, es la articulación  Tibioperonea Astragalina';
            set(handles.text6,'string',otro);
          else 
            mitexto = 'Error';
            set(handles.text10,'string',mitexto);
            otro= 'No se cuenta con esta información';
            set(handles.text6,'string',otro);  
          end
    else 
    mitexto = 'Error';
    set(handles.text10,'string',mitexto);
    otro= 'No se cuenta con esta información';
    set(handles.text6,'string',otro);  
    end
 end
end
end
% aui mandar imagen del tipo de articulación axes.4


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
limpia='';
set(handles.text3,'string',limpia);
set(handles.text10,'string',limpia);
set(handles.text6,'string',limpia);
cla(handles.axes4,'reset')
cla(handles.axes5,'reset')
global cont coti coti2 coti3 angulos
cont=0;
coti=0;
coti2=0;
coti3=0;
angulos=0;


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global coti3
if  rem(coti3,2)==0
    i=imread('ayuda.jpg');
    axes(handles.axes5)
    image(i)
else
    cla(handles.axes5,'reset')
end
coti3=coti3+1;


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cont angulos puerto_serial angulomax angulomin;
cont=cont+1;
    if cont==1
        mitexto = '¿La articulación permite realizar movimientos de fexión-extensión?';
        set(handles.text3,'string',mitexto);
    end 
    if cont==2
        mitexto = '¿La articulación permite realizar movimientos de aducción-abducción?';
        set(handles.text3,'string',mitexto);
    end 
    if cont==3
        mitexto = '¿La articulación permite realizar movimientos de circunducción?';
        set(handles.text3,'string',mitexto);
    end
    if cont==4
        mitexto = 'Por favor mida los angulos al realizar flexión y extensión con la articulación (minimo-maximo), al terminar oprima siguiente';
        set(handles.text3,'string',mitexto);
    end 
    if cont==5
        mitexto = 'Oprima calcular';
        set(handles.text3,'string',mitexto);
        angulos=1;        
    end 
        
% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cont; 
cont=0;
mitexto = '¿La articulación permite realizar movimientos de rotación?';
set(handles.text3,'string',mitexto);




% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global superior inferior
superior=0;
inferior=1;

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global superior inferior
superior=1;
inferior=0;
