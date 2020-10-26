function dg = LogDer (z)
g = hipoLog (z);
dg=g.*(1-g);
end