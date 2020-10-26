%LABORATORIO 2-TRANSFORMADAS 2017
%BIOINGENIERÍA-V SEMESTRE
%JOHANA NATALY TINOCO
%FÁTIMA MARY ROCHA
%JULIETH CAROLINA MONTES
clear all
clc
fileID = fopen ( 'ECG.txt' , 'r' );
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
plot (A,'m'), grid minor
b=sort(A);
c=b(1000,1);
d=b(999,1);
e=b(998,1);
for i=1:length(A)
    if A(i,1)==c
       c1=i;
    elseif A(i,1)==d
         d1=i;
    elseif A(i,1)==e
         e1=i;
    end
end
hold on
plot(c1,c,'*r')
plot(d1,d,'*g')
plot(e1,e,'*b')

f=c1-e1;% cantidad de muestras que hay entre dos picos (R)
% Calcular frecuencia 
% tomando en cuenta que las mil muestras se tomaron en 2 segundos
% Se mira la cantidad de muestras que hay entre dos r
% se hace una regla de 3 para saber los segundos en que se tomaron esa
% cantidad de muestras (variable f)
regla3=(f*2)/1000;
% averiguando como se mide la frecuencia, se sabe que se calcula por
% cuadros, donde cada cuadro mide 0,2
numcuadros=regla3/0.2;
%  para saber la frec 300/numerode cuadros 
frecuenciacar=300/numcuadros;
disp('Frecuencia cardiaca del txt:')
disp(frecuenciacar)


%señal lab 1

x=0:0.009*2:(pi/((2.7*pi*95)/180)); 
p=zeros(size(x));
n=10;
    for i=0:n
        result=((-1)^(i)*(((2.7*pi*95)/180)*x).^(2*i+1)/factorial(2*i+1));
        p=p + result;
    end
p=0.125*p;
%segmento pq
 pq=zeros(1,25);
%AMPLITUD QRS
    q=0:10;
    y=(-0.1/10)*q;
    r=0:20;
    y2=(((0.97+0.1)/(20))*r)-0.1;
    s=0;
    y3=((((-0.97)/(20))*s) + 0.97);
    
    %segmento st
    st=zeros(1,50);
    %onda T
    t=-(pi/2)/2:0.009*2:(pi/2)/2;
    T=zeros(size(t));
    n=10;
        for i=0:n
            result=(-1)^i*(2*t).^(2*i)/factorial(2*i);
            T= T + result;
        end
        T=0.16*T;
   %segmento tp
   tp=zeros(1,32);
   st1=zeros(1,20);
   %vector final
    h=[ p pq y y2 y3 st T tp st1];
    ciclos=2;
    ft=287;   
for  i=1:ciclos
    h1=1:1:ciclos*length(h);
        for con=1:ciclos
            h1(1,(length(h)*((con)))-(length(h)-1):(length(h))*((con)))=h;
        end
end 
st2=zeros(1,17);
st3=zeros(1,19);
pq1=zeros(1,28);   
tp1=zeros(1,23);
tp2=zeros(1,13);
pq2=zeros(1,12);

%gracica ecg lab1
h1=([tp1 h1 tp2 p pq2 y y2 y3 st T tp st2 p pq1 y y2 y3 st3]);  

[DY,DX]= findpeaks(h1);
%amplitudes
N=sort(h1);
ampliecg1=DY(2)-N(1,1);
amplitudtar=c-b(1,1);
difam=amplitudtar/ampliecg1;
h1=h1*difam;
% que tan arriba esta en y
dy=b(1,1)+(amplitudtar/7);
h1=h1+dy;
%Esto es para saber la posición de los picos 
plot(h1)
hold on;
grid minor;
%Esto es para saber la posición de los picos 
[D,PosPic]= findpeaks(h1);
plot(PosPic(2),D(2),'*g',PosPic(5),D(5),'*g',PosPic(8),D(8),'*g')
%para saber la distancia entre los picos
f2=PosPic(5)-PosPic(2);
f3=PosPic(8)-PosPic(5);
f4=PosPic(11)-PosPic(8);

%Frecuencia ecg lab 1.

regla31=(f2*2)/1000;
numcuadros1=regla31/0.2; 
frecuenciacar1=300/numcuadros1;
disp('Frecuencia cardiaca del ecg lab1:')
disp(frecuenciacar1)


% Diferencia de las señales con metrica de magnitud E
R=zeros (length(A),1);
R=A-h1';
vtf=R.^2;
R1=vtf(1,1);
for i=2:length(vtf)-1
    R1=vtf(i,1)+R1;
end
vtf1=sqrt(R1);
disp('La distancia entre las ondas es de:')
disp (vtf1)
% Diferencia de frecuencia con cosenos 
ppunto=dot(h1',A);
magnitud=norm(h1);
magnitud1=norm(A);
difco=ppunto/(magnitud*magnitud1);
if ceil(difco)==1
    disp('Las frecuancias de las dos señales son iguales')
else
    disp('Las frecuancias de las dos señales NO son iguales')

end

fclose(fileID);