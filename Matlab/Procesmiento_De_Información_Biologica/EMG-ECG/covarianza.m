signalrefe=1:1:100;
signal=1:1:100;
signalrefe=signalrefe';
signal=signal';
tamavent=20;
cont=1;
contador=tamavent;
multiplo=1;
covaf=0;
covas=0;
multiplir=zeros(length(tamavent),1);
desrx=zeros(length(tamavent),1);
desry=zeros(length(tamavent),1);
for j=tamavent:tamavent:length(signal)
            %media
             mediarefy=mean(signalrefe(cont:contador,1));
             mediarefx=mean(signal(cont:contador,1));
             %
             tre=signal(cont:contador,1);
             reff=signalrefe(cont:contador,1);
% %              for i=1:length(reff)
%              refy=(reff(i,1)-mediarefy);    
%              refx=(tre(i,1)-mediarefx);
%              multiplir(i,1)=refy*refx;
             covaf=sum((tre-mediarefx).*(reff-mediarefy))/(length(reff)-1);
             %desviaciónx
             da1=sum((tre-mediarefx).^2);
             desvx=sqrt((1/(length(tre)-1))*da1);
             %desviacióny
             da2=sum((reff-mediarefy).^2);
             desvy=sqrt((1/(length(reff)-1))*da2);
             %coeficiente
             coeref=covaf/(desvx*desvy);
%              end
            cont=multiplo*tamavent;
            multiplo=multiplo+1;
            contador=multiplo*tamavent;
 end