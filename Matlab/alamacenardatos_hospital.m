
disp('¡Bienvenido!')
disp('Base de datos del hospital paso al infierno <3')
depo={'Codigo','Nombre ',  'N° Identificación ',' Talla ',' Peso ',' Presión Arterial ',' Genero ','Oxigenación ', 'Estado Fisico'};
n=input('Ingrese el número de deportistas:');
for i=2:1:n+1
depo{i,1}=i-1;
depo{i,2}=input('Ingrese el nombre completo del deportista:','s');
depo{i,3}=input('Ingrese el numero de identificación del  deportista:');
depo{i,4}=input('Ingrese la talla del  deportista (en cm):');  
depo{i,5}=input('Ingrese peso del  deportista (en Kg):');
sistolica=input('Ingrese la presion sistolica del deportista:');
distolica=input('Ingrese la presion distolica del deportista:');
presion_arterial=(sistolica/distolica);
depo{i,6}=(presion_arterial);
genero=input('Ingrese el genero del deportista (Masculino:M - Femenino:F):','s');

if (genero=='M'|| genero=='m')
    genero='Masculino';
elseif (genero=='F'|| genero=='f')
    genero='Femenino';
else 
    genero='ERROR';
end
depo{i,7}=(genero);
oxigenacion=((presion_arterial*100*0.023)/(760));
depo{i,8}=(oxigenacion);
if  depo{i,8}<= 75
    estadofisico='Bajo';
elseif depo{i,8}>=100
    estadofisico='Bajo';
elseif depo{i,8}>=75 && oxigenacion<=100
    estadofisico='Alto';
else
    estadofisico='no definido';
end
depo{i,9}=(estadofisico)
end
%modificar datos
dat=input('¿Desea modificar los datos almacenados? Si su respuesta es si marque 1, de lo contrario marque 0:  ');
if dat==1
    k=input('Numero del deportista del cual desea modificar datos:');
    l=k+1;
    j=input('Numero de la columna de la que desea modificar de datos: ');
    dis=input('Reemplace el dato: ','s');
    depo{l,j}=dis;
    depo
else
    disp=('Puede visualizar los datos de los deportitas');
end
disp('PROMEDIOS')
prom={'Estatura', 'Peso', 'Oxigenación','Estado Fisico'};
estatura=0;
estatura=(estatura+depo{i,4})/n;
prom{2,1}=(estatura);
peso=0;
peso=(peso+depo{i,5})/n;
prom{2,2}=(peso);
oxigena=0;
oxigena=(oxigena+depo{i,8})/n;
prom{2,3}=(oxigena);
if prom{2,3} <= 75
   promestado='Bajo';
elseif prom{2,3}>=100
     promestado='Bajo';
elseif prom{2,3}>=75 && oxigenacion<=100
    promestado='Alto';
else
   prometado='sin promedio';
end
prom{2,4}=(promestado)
