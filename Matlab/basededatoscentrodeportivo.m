%%reto#3 bioinstrumentacion MATLAB 2016
%bioingenieria
%integrantes: Tinoco Nataly_Mojica Paula
disp ('BIENVENIDOS')
disp ('BASE DE DATOS DEL CENTRO DEPORTIVO,solo estan estos deportes (ciclismo,gimnasia,rugby,baloncesto,remo, futbol,natacion,tenis,golf,pesas )')
disp('ingrese los siguientes datos:' );
%datos, es la tabla de datos obtenidos del deportista
datos={'Codigo','Nombre ','Deporte ','Edad',' Peso ',' Talla ',' P. Triceps ','P. subescapular ','P. suprailiaico','P. Abdominal ','P. Muslo','P. pierna','Peri. Antebrazo','Peri. Brazo','Peri. Muslo','Peri. pierna','% grasa corporal','% masa corporal'};
%A, es la tabla de porcentaje proteico por secciones y estado fisico del deportista 
A={'% en el antebrazo','Reserva Proteica','% en el brazo','Reserva Proteica','% en el muslo','Reserva Proteica','% en la Pierna','Reserva Proteica','Estado Fisico'};
n=input('Deme numero de deportistas que desee ingresar a la base de datos: ');
for i=2:1:n+1
datos{i,1}=i-1;
datos {i,2}=input('Ingrese el nombre completo del deportista: ','s');
datos{i,3}=input('Deporte: ','s');
datos{i,4}=input('Edad:  ');
datos{i,5}=input('Peso: ');
datos{i,6}=input('Talla: ');
datos{i,7}=input('Pliegue triceps: ');
datos{i,8}=input('Pliegue subescapular: ');
datos{i,9}=input('Pliegue suprailiaico: ');
datos{i,10}=input('Pliegue abdominal: ');
datos{i,11}=input('Pliegue muslo: ');
datos{i,12}=input('Pliegue pierna: ');
datos {i,13}=input('Perimetro de antebrazo: ');
datos{i,14}=input('Perimetro de brazo: ');
datos{i,15}=input('Perimetro de muslo: ');
datos{i,16}=input('Perimetro de pierna: ');
datos{i,17}=input('Porcentaje de grasa corporal: ');
datos{i,18}=input('Porcentaje de masa corporal: ')
% Proteina por secciones del atleta:
%en el antebrazo
antebrazo=(datos{i,13})^2/(4*3.1416);
plot((datos{i,13})^2/(4*3.1416))
A{i,1}=antebrazo;
A{i,2}=llenartabla(antebrazo);
%en el brazo
brazo=(datos{i,14})^2/(4*3.1416);
A{i,3}=brazo;
A{i,4}=llenartabla(brazo);
%en el muslo 
muslo=(datos{i,15})^2/(4*3.1416);
A{i,5}=muslo;
A{i,6}=llenartabla(muslo);
%en la pierna 
pierna=(datos{i,16})^2/(4*3.1416);
 A{i,7}=pierna;
 A{i,8}=llenartabla(pierna);
% estado fisico segun cada deporte 
switch datos{i,3}
   case 'ciclismo'
       if datos{i,18}>=8 && datos{i,18}<=15
       estadofisico='Bueno';
           
       else 
        estadofisico='Malo';
       end 
        
    case 'gimnasia'
        
        if datos{i,18}>=8 && datos{i,18}<=12
           estadofisico='Bueno';
           
       else 
       estadofisico='Malo';
        end 
    case 'futbol'
       if datos{i,18}>=10 && datos{i,18}<=18
        estadofisico='Bueno';
           
       else 
         estadofisico='Malo';
       end 
        
    case 'natacion' 
        
       if datos{i,18}>=10 && datos{i,18}<=18
           estadofisico='Bueno';
       else 
         estadofisico='Malo';
       end 
       
    case 'tenis'
        
       if datos{i,18}>=10 && datos{i,18}<=20
         estadofisico='Bueno';
           
       else 
       estadofisico='Malo';
       end 
        
    case 'golf'
       if datos{i,18}>=12 && datos{i,18}<=20
         estadofisico='Bueno';
           
       else 
       estadofisico='Malo';
       end 
    case 'pesas'
        if datos{i,18}>=10 && datos{i,18}<=20
          estadofisico='Bueno';
           
       else 
       estadofisico='Malo';
        end
        
    case 'rugby' 
       if datos{i,18}>=6 && datos{i,18}<=19
         estadofisico='Bueno';
           
       else 
     estadofisico='Malo';
       end 
        
    case 'baloncesto' 

       if datos{i,18}>=6 && datos{i,18}<=10
          estadofisico='Bueno';
           
       else 
        estadofisico='Malo';
       end
       
      
    case 'remo'
        
         if datos{i,18}>=8 && datos{i,18}<=16
        estadofisico='Bueno';
           
         else 
         estadofisico='Malo';
         end
       
end
 A{i,9}=(estadofisico)
% Peso graso: 
graso=(datos{i,5}*datos{i,17})/100;
% Peso residual:
residual=(datos{i,5}*0.241);
% Peso corporal magro:
magro=datos{i,5}*(100- datos{i,17})/100;
%GRAFICAS
a=[1 2 3 4]; % donde seciones proteicas 1(antebrazo), 2(brazo), 3(muslo),4(pierna)
b=[antebrazo,brazo,muslo,pierna];
subplot(2,2,1),bar(a,b,'r'),title('Grafica de secciones proteicas')
c=[1 2 3];% donde 1(%peso graso), 2(%peso residual),3(%peso corporal magro)
d=[graso residual magro];
subplot(2,2,2),bar(c,d,'g'),title('Grafica de % de grasa')
end 