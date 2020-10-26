function[J, grad] = CosteRedNeuronal (Theta, n, sl, num_clases, X, y, lambda)
%dividir los thetas
Theta1=reshape(Theta(1:(n+1)*sl),[sl n+1]);
Theta2=reshape(Theta(((n+1)*sl)+1:end),[num_clases sl+1]);
%se binariza la salida 
yz=[zeros(size(X, 1)/num_clases,num_clases-1) ones(size(X, 1)/num_clases,1); ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-1);zeros(size(X, 1)/num_clases,1) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-2);zeros(size(X, 1)/num_clases,2) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-3);zeros(size(X, 1)/num_clases,3) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-4); zeros(size(X, 1)/num_clases,4) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-5);zeros(size(X, 1)/num_clases,5) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-6);zeros(size(X, 1)/num_clases,6) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-7);zeros(size(X, 1)/num_clases,7) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-8); zeros(size(X, 1)/num_clases,8) ones(size(X, 1)/num_clases,1) zeros(size(X, 1)/num_clases,num_clases-9)];
%
m=length(X(:,1));
% for i=1:m
%     yz(i,y(i))=1;
% end 

X0=ones(m,1);
X=[X0 X];
ZS1=X*Theta1';
%PRIMERACAPA
h1 = hipoLog (ZS1);
Z0=ones(m,1);
ZS1=[Z0 h1];
ZS2=ZS1*Theta2';
%segunda capa
h2 = hipoLog (ZS2);

%FUNCIÓN DE COSTE 
J=-(1/m)*((sum(sum((yz.*log(h2))+((1-yz).*log(1-h2))))))+(lambda/(2*m))*((sum(sum((Theta1(:).^2)))+(sum(sum(Theta2(:).^2)))));

%gradiente
%1. errores
error1=zeros(size(Theta1));
error2=zeros(size(Theta2));
for i=1:m
    %a1=X(i,:);
    %error por capas de salida
    %s3=a-y
    %s2=theta*s*dg
    ss3=h2(i,:)-yz(i,:);
    %funcion de activación 
    dg=LogDer(ZS1(i,:));
    ss2=(Theta2'*ss3').*dg';
    %formulas de el error acumulado
    error1= error1 + ss2(2:end)*X(i,:);
    error2= error2 + (ss3'*ZS1(i,:));
end
%2. gradiente
%como se calculo en clase
% grad1=(1/2)*error1;
% grad2=(1/2)*error2;
%con regularización, diapositivas 
grad1=(1/m)*(error1 +lambda*Theta1);
grad2=(1/m)*(error2 +lambda*Theta2);
% se pone (:) para que se vuelva vector
grad=[grad1(:); grad2(:)];
end
