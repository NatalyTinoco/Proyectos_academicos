%% Laboratorio Redes neuronales
%
% Instrucciones. Implementar las siguientes funciones para entrenar una red
% neuronal. No debe modificar esta rutina principal a menos que se pida lo
% contrario.
%     PropAdelante
%     LogDer.m 
%     CosteRedNeuronal.m (puede basarse en su implementaci�n de la regresi�n
%                         log�stica)
%     InicializarTheta.m
%     GradienteNumerico.m
% Nota: necesitar� algunas de las funciones implementadas en el laboratorio
% de regresi�n log�stica

%% %%%%%%%%%%%%%%%%% PARTE A: PROPAGACI�N HACIA ADELANTE %%%%%%%%%%%%%%%%%%
% Inicializaci�n y definici�n de par�metros
clc; close all; clear;
n_entrada  = 400;         % Imagenes de 20x20 p�xeles
n_oculta = 25;            % 25 nodos en la capa oculta
num_clases = 10;          % 10 nodos en la capa de salida

% cargar datos de entrenamiento y par�metros optimizados
load 'Lab8data.mat' ThetaFF1 ThetaFF2 X y; 
m = size(X, 1);           % N�mero de observaciones

%% === Parte 1: Implementar Propgaci�n hacia delante =========
%
claseNN = PropAdelante(ThetaFF1, ThetaFF2, X);

%% ============= Parte 2: Rendimiento del modelo =============
% En esta parte se debe obtener el porcentaje del n�mero de aciertos de la
% clasificaci�n en comparaci�n con las observaciones reales

% La siguiente gr�fica permite comparar la salida del algoritmo (class)
% con los datos de entrenamiento proporcionados (y) de manera visual para 
% tener una noci�n de lo obtenido con el algoritmo

figure, plot(y,'marker','s');
hold on, plot(claseNN,'linestyle',':', 'marker','+','color',[0 0.5 0])
legend('clase original', 'clase predecida')
xlabel('observaciones'), ylabel('clases')
title('Modelo de clasificaci�n por redes neuronales')
fprintf('\nPorcentaje de Aciertos del conjunto de entrenamiento = %f\n', mean(double(claseNN == y)) * 100);
display('(PA= 97.52 si es correcta su implementaci�n)');

%% %%%%%%%%%%%% PARTE B: PROPAGACI�N HACIA ATR�S %%%%%%%%%%%%%%%%%%%%%%%%%%
% Inicializaci�n
clear ; close all; clc
% Cargar datos y par�metros iniciales

load lab8data.mat Thetain1 Thetain2 X y
n  = 400;  % Entradas, imagenes de 20X20 pixeles
sl = 25;   % 25 unidades en la capa oculta
num_clases = 10;          % 10 clases de salida (1- 10) con 0== clase 10 


%% =========== Parte 1: Cargar datos y par�metros =============
m = size(X, 1);

% hacer un vector de par�metros theta
theta_in = [Thetain1(:) ; Thetain2(:)];

%% ===== Parte 2: Computar el Costo con los par�metros iniciales(FP) ======
%  En esta parte del algoritmo debe implementar la funci�n de coste de la red
%  neuronal y probar que su salida sea correcta. Inicialmente puede asumir
%  un costo si regularizaci�n

% Factor de regularizaci�n
lambda = 0;

J = CosteRedNeuronal(theta_in, n, sl, num_clases,...
                    X, y, lambda);

                
% Comprobar la implementaci�n de la funci�n de coste
fprintf(['Con los valores iniciales Thetain1 y Thetain2'... %f '...
         '\nel valor de la funci�n de coste es: %f'...
         '\n(si su implementaci�n es correcta debe ser 0.287629)\n'], J);
fprintf('Pausa. Presione enter para continuar.\n');
pause;
%% =============== Parte 3: Implementar Regularizaci�n ===============
%  Una vez haya comprobado que su funci�n de coste est� correctamente
%  implementada, comprobar la implementaci�n de la regularizaci�n

fprintf('\nComprobando J con regularizaci�n ... \n')

lambda = 1; %utilizaremos incialmente este valor de lambda

J = CosteRedNeuronal(theta_in, n, sl, num_clases,...
                    X, y, lambda);

fprintf(['Para los par�metros theta_in previamente establecidos y con lamda= 1,'...
          '\nel valor de la funci�n de coste es J= %f'...
         '\n(debe ser igual a 0.383770)\n'], J);

fprintf('Pausa. Presione enter para continuar.\n');
pause;


%% ================ Parte 4: Inicializaci�n de Par�metros ================
%  En esta parte del algoritmo debe implementar una funci�n para
%  inicializar aleatoriamente los par�metros de aprendizaje Theta de cada
%  capa

in_Theta1 = InicializarTheta(n, sl);
in_Theta2 = InicializarTheta(sl, num_clases);

% Poner todos los par�metros en un vector
rand_Theta_in = [in_Theta1(:) ; in_Theta2(:)];


% %% ========= Parte 5: Implementar Backpropagation y comprobarlo ==========
% %  Una vez comprobado que funciona la implementaci�n de la funci�n de
% %  coste, implementar el algoritmo de BP para obtener la derivada de la
% %  funci�n de coste y comprobar que funcione correctamente
% %  En esta parte deber� implementar el algoritmo de comprobaci�n del
% %  gradiente por m�todos num�ricos en la funci�n GradienteNumerico
% 
% fprintf('\nComprobando Backpropagation... \n');
% 
% %  Comprobar el gradiente de BP con ComprobarGradiente
% ComprobarGradiente;
% 
% fprintf('Pausa. Presione enter para continuar.\n');
% pause;
% %==================no se hizo================
% 
% %% ====== Parte 6: Implementar Regularizaci�n para el gradiente ============
% %  Si BP es correcta, continuar implementado regularizaci�n
% 
% fprintf('\nComprobando BP con Regularizaci�n ... \n')
% 
% %  Comprobar el gradiente de BP con ComprobarGradiente
% lambda = 3;
% ComprobarGradiente(lambda);
% 
% % comprobar tambien la funci�n de coste
% debug_J  = CosteRedNeuronal(theta_in, n, sl, num_clases,...
%                     X, y, lambda);
% 
% fprintf(['\n\nCosto en los par�metros preestablecidos (con lambda=3): %f ' ...
%          '\n(este valor debe ser 0.576051)\n\n'], debug_J);
% 
% fprintf('Pausa. Presione enter para continuar.\n');
% pause;
% %================no se hizo===========

%% =================== Parte 7: Entrenar la RN ===================
%  Una vez hechas las comprobaciones correspondientes, entrenar la red
%  neuronal. Para esto puede utilizar la funci�n fminunc que es un
%  algoritmo de optimizaci�n avanzado

fprintf('\nEntrenando la Red Neuronal... \n')

% En este caso vamos a utilizar 100 iteraciones.
load opciones_opt.mat;

%  Debera probar diferentes valores de lambda
lambda = input('Entre valor de lambda= ');
while ~isnumeric(lambda)
    fprintf('\nlambda debe ser un valor num�rico');
    lambda = input('Entre valor de lambda= ');
end
it = input('Entre # de iteraciones= ');
while ~isnumeric(it)
    fprintf('\nEl n�mero de iteraciones debe ser un valor num�rico');
    lambda = input('Entre # de iteraciones= ');
end
options.MaxIter = it;
% Crear una variable auxiliar para la FC
costoRed = @(p) CosteRedNeuronal(p, ...
                                   n, ...
                                   sl, ...
                                   num_clases, X, y, lambda);


%[Theta, costo] = fmincg(costoRed, rand_Theta_in, options);
%Theta1=reshape(theta_in(1:(n+1)*sl),[sl n+1]);
%Theta2=reshape(theta_in(((n+1)*sl)+1:end),[num_clases sl+1]);
%rand_Theta_in=[Theta1(:);Theta2(:)];
[Theta, costo] = fmincg(costoRed, rand_Theta_in, options);
% Obtener Theta1 y Theta2 a partir de Theta
Theta1=reshape(Theta(1:(n+1)*sl),[sl n+1]);
Theta2=reshape(Theta(((n+1)*sl)+1:end),[num_clases sl+1]);
% Theta1=in_Theta1;
% Theta2=in_Theta2;
fprintf('Pausa. Presione enter para continuar.\n');
pause;

%% ================= Parte 8: Implementar Predicci�n =================
%  Una vez entrenada la red neuronal, los par�metros Theta nos sirven para
%  predecir nuevos valores que le sean presentados. 
%  En esta parte implementar� la funci�n Predecir  para predecir a que 
%  d�gito pertenece cada una de las im�genes de los datos de entrenamiento
%  (si hubiera un conjunto de validaci�n, podr�a utilizarla para predecir
%  la clase de esto datos). A partir de los valores predecidos, puede
%  calcular el rendimiento de la red neuronal
%  Puede utilizar la funci�n PropAdelante para este prop�sito

pred = PropAdelante(Theta1, Theta2, X);
PredTotal=mean(double(pred == y)) ;

fprintf(['\nPara labmda= ' num2str(lambda) ' y ' num2str(options.MaxIter) ' iteraciones, se obtiene:'])
fprintf('\nPorcentaje de aciertos del conjunto de entrenamiento: %f\n', PredTotal * 100);              