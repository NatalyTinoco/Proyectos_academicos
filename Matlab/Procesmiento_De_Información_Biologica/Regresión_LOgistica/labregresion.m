clear all
clc 
load('iris.mat')
x0=ones(1,length(X(:,1)));
X=[x0' X];
theta=[0.1;0.3;0.6;0.5;1];
lambda=0.5;
[J, grad] = CosteRL(theta, X, y, lambda);
load 'opciones_opt.mat';
%theta=fmincg(@(t)(CosteRL(t, X, y, lambda)), theta0, op);
num_clases=length(X(1,:));
%clase 1
y1=[ones(35,1);zeros(70,1)];
[THETA1] = UnovsTodosOptim(X, y1, num_clases, lambda);
clase1 = AsignarClase (THETA1, X);
%clase 2
y2=[zeros(35,1);ones(35,1);zeros(35,1)];
[THETA2] = UnovsTodosOptim(X, y2, num_clases, lambda);
clase2 = AsignarClase (THETA2, X);

%clase 3
y3=[zeros(35,1);zeros(35,1);ones(35,1)];
[THETA3] = UnovsTodosOptim(X, y3, num_clases, lambda);
clase3 = AsignarClase (THETA3, X);

