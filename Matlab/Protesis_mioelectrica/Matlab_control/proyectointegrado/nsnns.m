clear,clc
a=cell(1,100);  
direc='D:\Documents\Matlab\proyectointegrado\señales';
 
list = dir([direc,'/*.txt']);
list = list(~cellfun(@isempty,{list(:).date}));
 
%nf=zeros(1,length(list));
%%str = strings(size(list));
for na=1:length(list)
    a{1,na}=list( na ).name;
   % disp( list( na ).name ); 
% operaciones especificas para cada uno de los archivos;

end

 %=textscan({1,1},'%s %s %s %s ');
Dat=fopen(list(1).name,'r');
n=1;
leer_linea = fgetl(Dat);
