clear all
clc 
load('fisheriris.mat');

c1=(virginica(:,1).^2);
c2=(virginica(:,2).^2);
ravir=sqrt(c1+c2);

p1=(setosa(:,1).^2);
p2=(setosa(:,2).^2);
raver=sqrt(p1+p2);


% gaussianas
figure 
[vir,set] = createFit(ravir,raver);

figure 
x=4.5:5/length(ravir):9.5-1/length(ravir);
y=pdf(vir,x);
plot(x,y,'r')
hold on;
x2=4.5:5/length(raver):9.5-1/length(raver);
y2=pdf(set,x2);
plot(x2,y2)
legend('Virginica','Setosa')

% roc
contador=1;
%multi=1;
for i=1:length(ravir)-1
    if x(i)==4.5
        VP=sum(y(:));
        FP=sum(y2(:)); 
        VN=0;
        FN=0;
    end
    if x(i)>=5
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
    end
    if x(i)>=5.5
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
    end
    if x(i)>=6
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
    end
   if x(i)>=6.5
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
   end
   if x(i)>=7
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
   end
   if x(i)>=7.5
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));   
    end
    if x(i)>=8
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));   
    end
    if x(i)>=8.5
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
    end
    if x(i)>=9
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
    end
    if x(i)>=9.5
        VP=sum(y(i:length(y)));
        FP=sum(y2(i:length(y))); 
        VN=sum(y2(1:i));
        FN=sum(y(1:i));
    end
    
   
%    %Declarar variables 
%     VN=a-VP;
%     FN=b-FP;
   %Sensibilidad
    S=VP/(VP+FN);
   %Especificidad
    E=VN/(VN+FP);
   %Error
    ER=(FP+FN)/(VP+VN+FP+FN);
   Stot(contador,1)=S;
   Etot(contador,1)=E;
   ERtot(contador,1)=ER;
   contador=contador+1;
end

% inEtot=sort(Etot,'descend');
figure
plot(1-Etot,Stot,'r')
hold on
xx=0:1;
plot(xx,xx)
xlabel('1-especificidad')
ylabel('sensibilidad')

for i=1:length(ravir)-1
     w=mean(Stot(:));
     w1=mean(Etot(:));
%    if Stot==Etot
%        w=Stot;
%    end
 end
punx=(w*8)/1;
puny=(punx*(2.1))/4;
 
figure
scatter(virginica(:,1),virginica(:,2),'*r');
hold on
scatter(setosa(:,1),setosa(:,2),'*b');
hold on%%no se generar el vector
% x3=4:0.02:punx;
% y3=2:0.01:puny;
ejex=4:0.1:8;
recta=((2-puny)/(4-punx))*(ejex-punx)+puny;
plot(ejex,recta,'g')
xlabel('Longitud sepalo');
ylabel('Ancho sepalo');
legend('Virginica','setosa')

