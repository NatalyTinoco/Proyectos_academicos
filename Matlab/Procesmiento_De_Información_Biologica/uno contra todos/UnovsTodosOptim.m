function [THETA] = UnovsTodosOptim(X, y, num_clases, lambda)
theta0=[0.1;0.3;0.6;0.5;1];
load 'opciones_opt.mat';
THETA=fmincg(@(t)(CosteRL(t, X, y, lambda)), theta0, op);
end