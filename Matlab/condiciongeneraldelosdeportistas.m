[a,b,c]=xlsread('tabla','A2:C11');%Tabla de excel, datos de interes.
pro=mean(a);%promedio de condicion fisica
A=[pro pro pro pro pro pro pro pro pro pro ];
bar(a)%grafica del promedio de la condicion general de los deportistas 
hold on
plot(A,'green')%linea de promedio para la grafica de condicion de los deportistas 
xlabel('Deportistas')
ylabel('Condición fisica')
title('Condición general de los deportistas') 
depo={'nombre','deporte','porcentaje de masa corporal','Estado Fisico'};
%Para pasar los datos de excel a una tabla (depo)
 depo{2,1}=c{1,1}; depo{3,1}=c{2,1}; depo{4,1}=c{3,1}; depo{5,1}=c{4,1}; depo{6,1}=c{5,1};
 depo{7,1}=c{6,1}; depo{8,1}=c{7,1}; depo{9,1}=c{8,1}; depo{10,1}=c{9,1}; depo{11,1}=c{10,1};
 depo{2,2}=c{1,2}; depo{3,2}=c{2,2}; depo{4,2}=c{3,2}; depo{5,2}=c{4,2}; depo{6,2}=c{5,2};
 depo{7,2}=c{6,2}; depo{8,2}=c{7,2}; depo{9,2}=c{8,2}; depo{10,2}=c{9,2}; depo{11,2}=c{10,2};
 depo{2,3}=c{1,3}; depo{3,3}=c{2,3}; depo{4,3}=c{3,3}; depo{5,3}=c{4,3}; depo{6,3}=c{5,3};
 depo{7,3}=c{6,3}; depo{8,3}=c{7,3}; depo{9,3}=c{8,3}; depo{10,3}=c{9,3}; depo{11,3}=c{10,3};
for i=2:11 
 switch depo{i,2}
     case 'Futbol'
     if depo{i,3}>=10 && depo{i,3}<=18
        estadofisico='Bueno';
       
     else 
        estadofisico='Malo';
        disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la  rutina: ');
             disp (depo{i,1})
        fileiD=fopen('rutina.txt');
     end 
    case 'Natacion' 
    if depo{i,3}>=10 && depo{i,3}<=18
        estadofisico='Bueno';
           
       else 
         estadofisico='Malo';
              disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la  rutina: ');
             disp (depo{i,1})
        fileiD=fopen('rutina.txt');
    end 
    case 'Tenis'
        
       if depo{i,3}>=10 && depo{i,3}<=20
         estadofisico='Bueno';
           
       else 
       estadofisico='Malo';
         disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la  rutina: ');
        disp (depo{i,1})
        fileiD=fopen('rutina.txt');
       end 
        
    case 'Golf'
       if depo{i,3}>=12 && depo{i,3}<=20
         estadofisico='Bueno';
       else 
         estadofisico='Malo';
          disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la rutina: ');
          disp (depo{i,1})
        fileiD=fopen('rutina.txt');
       end 
    case 'Pesas'
        if depo{i,3}>=10 && depo{i,3}<=20
          estadofisico='Bueno';
           
       else 
       estadofisico='Malo';
           disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la  rutina: ');
             disp (depo{i,1})
        fileiD=fopen('rutina.txt');
        end
        
    case 'Rugby' 
       if depo{i,3}>=6 && depo{i,3}<=19
         estadofisico='Bueno';
           
       else 
     estadofisico='Malo';
              disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la rutina: ');
             disp (depo{i,1})
        fileiD=fopen('rutina.txt');
       end 
        
    case 'Baloncesto' 

       if depo{i,3}>=6 && depo{i,3}<=10
          estadofisico='Bueno';
           
       else 
        estadofisico='Malo';
             disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la  rutina: ');
             disp (depo{i,1})
        fileiD=fopen('rutina.txt');
       end
       
      
    case 'Remo'
        
      if depo{i,3}>=8 && depo{i,3}<=16
        estadofisico='Bueno';
           
     else 
         estadofisico='Malo';
             disp('El siguiente deportista tiene estado fisico Malo y se recomienda que siga la rutina: ');
             disp (depo{i,1})
        fileiD=fopen('rutina.txt');
     end
       
 end
depo{i,4}=(estadofisico);
end
depo
winopen('rutina.txt')

