close all;
clear all;

s1=load('S1.txt');
s2=load('S2.txt');
s3=load('S3.txt');
s4=load('S4.txt');
s5=load('S5.txt');

st=[s1,s2,s3,s4,s5];
%%figure(1)
%%plot(st);
%%
for i=1: 5
    s1=load(['S', int2str(i), '.txt']);
    Fm=1000;
    L=length(s1);
    Frec=fft(s1);
    P2=abs(Frec/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    fs=Fm*(0:(L/2))/L;
    
    
    hold on;
    figure(i)
    plot(fs, P1);
    
end
 
 %%
   
    Fm=1000;
    L=length(s1);
    Frec=fft(s1);
    P2=abs(Frec/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    fs=Fm*(0:(L/2))/L;
    figure(3)
    plot(fs, P1);