function clase = AsignarClase (THETA, X)
X=X';
z=THETA'*X;
clase=hipoLog (z);
end