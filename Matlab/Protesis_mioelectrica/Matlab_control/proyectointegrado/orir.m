clear;
clc;
[Nombre_Arch, Dir_Arch] = uigetfile('*.txt', 'Seleccione un archivo de texto');
if isequal(Nombre_Arch,0)
   return;
else
   Archivo=fullfile(Dir_Arch, Nombre_Arch);
end
Dat = fopen(Archivo,'r');
n=1;
while ~feof(Dat)
   leer_linea = fgetl(Dat);
   if isempty(leer_linea) || ~ischar(leer_linea), break, end
   C(n)= cellstr(leer_linea);
   n=n+1;
end
fclose(Dat);
C=C';
disp(C);