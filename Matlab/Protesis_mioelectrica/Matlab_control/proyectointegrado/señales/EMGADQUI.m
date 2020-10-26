function varargout = EMGADQUI(varargin)
% EMGADQUI MATLAB code for EMGADQUI.fig
%      EMGADQUI, by itself, creates a new EMGADQUI or raises the existing
%      singleton*.
%
%      H = EMGADQUI returns the handle to a new EMGADQUI or the handle to
%      the existing singleton*.
%
%      EMGADQUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMGADQUI.M with the given input arguments.
%
%      EMGADQUI('Property','Value',...) creates a new EMGADQUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EMGADQUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      clean.  All inputs are passed to EMGADQUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EMGADQUI

% Last Modified by GUIDE v2.5 02-Oct-2017 20:19:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EMGADQUI_OpeningFcn, ...
                   'gui_OutputFcn',  @EMGADQUI_OutputFcn, ...
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


% --- Executes just before EMGADQUI is made visible.
function EMGADQUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EMGADQUI (see VARARGIN)

% Choose default command line output for EMGADQUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EMGADQUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear all
clc;
global puerto_serial 
delete(instrfind({'Port'},{'COM11'})); %inicializa el puerto serial
puerto_serial=serial('COM11');
puerto_serial.BaudRate=9600;
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

fopen(puerto_serial); %abre el puerto serial


% --- Outputs from this function are returned to the command line.
function varargout = EMGADQUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% parámetros de medidas
global tmax v1 puerto_serial
tmax = 160; % tiempo de captura en s
%%rate = 33; % resultado experimental (comprobar)
v1 = zeros(1,tmax);
i = 1;
t = 0;
% preparar la figura
axes(handles.axes1);
%%axes('XLim',[0 tmax],'YLim',[0 5.1]);
l1 = line(nan,nan,'Color','r','LineWidth',2);
ylim([0 5.1])
xlabel('Tiempo (s)')
ylabel('Voltaje (V)')
grid on
hold on
% ejecutar bucle cronometrado
%%tic
while t<tmax
    t = t+1;
    % leer del puerto serie
    a = fscanf(puerto_serial,'%d')';
    v1(i)=a(1)*5/1023;
    % dibujar en la figura
    x = linspace(0,i/22,i);
    set(l1,'YData',v1(1:i),'XData',x);
    drawnow
    % seguir
    i = i+1;
end
% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global v1 archivo
archivo = fopen('movimiento200.txt', 'wt');
for i=1:length(v1)
fprintf( archivo, '\n%f' , v1(1,i));
end
%%open('señalesteco.txt')
winopen('movimiento200.txt')

% --- Executes on button press in clean.
function clean_Callback(hObject, eventdata, handles)
% hObject    handle to clean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear puerto_serial;
axes(handles.axes1);
cla

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global puerto_serial
fclose(puerto_serial);
%delete(puerto_serial);
close all
