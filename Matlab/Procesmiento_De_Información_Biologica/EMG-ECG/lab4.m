%definir variables muestreo
frec=100;
Tm=1/frec;
ampli=1;
tiem=linspace(0,Tm,1000);
%determinar señales
senal1=ampli*sin(2*pi*frec*tiem-500);
senal2=ampli*cos(2*pi*frec*tiem+500);
senal1=senal1';
senal2=senal2';
%desfase=senal2+100;
t1=0:Tm:length(senal1)*Tm-Tm;
t2=0:Tm:length(senal2)*Tm-Tm;

%graficar
subplot(2,1,1)
plot(t1,senal1,'r') 
hold on
plot(t2,senal2,'b')

%calcular beta1
acumulador1=0;
acumulador2=0;

for i=1:length(senal1)
    acumulador1=(senal1(i,1)*t1(1,i))+acumulador1;
    acumulador2=(t1(1,i))^2 +acumulador2;
end
beta1=abs(acumulador1/acumulador2);
%calcular alfa
%a=y-bx
yp=mean(senal1);
xp=mean(t1);
a=abs(yp-beta1*xp);
% y=a +bx
%x=(y-a)b
yr1=0:Tm:length(senal1)*Tm-Tm;
xr1=(yr1-a)/beta1;
subplot(2,1,2)
plot(xr1,yr1,'r')
%calcular beta1
acumulador12=0;
acumulador22=0;

for i=1:length(senal2)
    acumulador12=(senal2(i,1)*t2(1,i))+acumulador12;
    acumulador22=(t2(1,i))^2 +acumulador22;
end
beta2=abs(acumulador12/acumulador22);
%calcular alfa
%a=y-bx
yp2=mean(senal2);
xp2=mean(t2);
a2=abs(yp2-beta2*xp2);
% y=a +bx
%x=(y-a)b
yr2=0:Tm:length(senal2)*Tm-Tm;
xr2=(yr2-a2)/beta2;
subplot(2,1,2)
hold on
plot(xr2,yr2,'b')


% %correlación cruzada
% 
% for i=1:length(signal1)-1
%     suma=signal1(i)*signal2()
% end
