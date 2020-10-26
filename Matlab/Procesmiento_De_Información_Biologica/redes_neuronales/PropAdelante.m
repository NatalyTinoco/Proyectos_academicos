function clase_NN = PropAdelante (ThetaFF1, ThetaFF2, X)
    X0=ones(5000,1);
    X=[X0 X];
    ZS1=X*ThetaFF1';
    h1 = hipoLog (ZS1);
    Z0=ones(5000,1);
    ZS1=[Z0 h1];
    ZS2=ZS1*ThetaFF2';
    h2 = hipoLog (ZS2);
    [C,I]=max(h2');
    clase_NN=I';
end