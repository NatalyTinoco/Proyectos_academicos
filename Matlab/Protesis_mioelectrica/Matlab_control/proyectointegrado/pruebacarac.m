clear all
close all
clc
signal=load('movimiento1 - copia (3).txt','w');
w=60;
fs=1000;
t = linspace(0,160/22,160);
plot(t,signal)

y2=filter(coeficientes.Numerator,1,signal);
hold on;
plot(t,y2)

