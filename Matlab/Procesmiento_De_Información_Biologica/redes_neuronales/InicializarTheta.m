function Theta0 = InicializarTheta (p, q)
omega=sqrt(6)/sqrt(p+q);
Theta0=rand(q,p)*(2*omega)-omega;
u=Theta0(:,1);
k=ones(length(u),1);
Theta0=[k Theta0];
end
