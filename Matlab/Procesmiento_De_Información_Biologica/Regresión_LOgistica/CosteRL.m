function [J, grad] = CosteRL(theta, X, y, lambda)
X=X';
z=theta'*X;
h=hipoLog (z);
m=length(X(1,:));
J=-(1/m)*sum(y'.*log(h)-(1-y').*log(1-h))+(lambda/2)*sum(theta.^2);
grad=(1/m)*sum((h-y')*X');
 %X=X';
 %for i=1:length(theta)
%     grad(i)=(1/m)*sum((h-y')*X(:,i));
end
