%% Laboratorio Redes neuronales
%
% Instrucciones. Implementar las siguientes funciones para entrenar una red
% neuronal. No debe modificar esta rutina principal a menos que se pida lo
% contrario.
%     PropAdelante
%     LogDer.m 
%     CosteRedNeuronal.m (puede basarse en su implementación de la regresión
%                         logística)
%     InicializarTheta.m
%     GradienteNumerico.m
% Nota: necesitará algunas de las funciones implementadas en el laboratorio
% de regresión logística

%% %%%%%%%%%%%%%%%%% PARTE A: PROPAGACIÓN HACIA ADELANTE %%%%%%%%%%%%%%%%%%
% Inicialización y definición de parámetros
clc; close all; clear;
n_entrada  = 400;         % Imagenes de 20x20 píxeles
n_oculta = 25;            % 25 nodos en la capa oculta
num_clases = 10;          % 10 nodos en la capa de salida

% cargar datos de entrenamiento y parámetros optimizados
load 'Lab8data.mat' ThetaFF1 ThetaFF2 X y; 
m = size(X, 1);           % Número de observaciones

%% === Parte 1: Implementar Propgación hacia delante =========
%
claseNN = PropAdelante(ThetaFF1, ThetaFF2, X);

%% ============= Parte 2: Rendimiento del modelo =============
% En esta parte se debe obtener el porcentaje del número de aciertos de la
% clasificación en comparación con las observaciones reales

% La siguiente gráfica permite comparar la salida del algoritmo (class)
% con los datos de entrenamiento proporcionados (y) de manera visual para 
% tener una noción de lo obtenido con el algoritmo

figure, plot(y,'marker','s');
hold on, plot(claseNN,'linestyle',':', 'marker','+','color',[0 0.5 0])
legend('clase original', 'clase predecida')
xlabel('observaciones'), ylabel('clases')
title('Modelo de clasificación por redes neuronales')
fprintf('\nPorcentaje de Aciertos del conjunto de entrenamiento = %f\n', mean(double(claseNN == y)) * 100);
display('(PA= 97.52 si es correcta su implementación)');

%% %%%%%%%%%%%% PARTE B: PROPAGACIÓN HACIA ATRÁS %%%%%%%%%%%%%%%%%%%%%%%%%%
% Inicialización
clear ; close all; clc
% Cargar datos y parámetros iniciales

load lab8data.mat Thetain1 Thetain2 X y
n  = 400;  % Entradas, imagenes de 20X20 pixeles
sl = 25;   % 25 unidades en la capa oculta
num_clases = 10;          % 10 clases de salida (1- 10) con 0== clase 10 


%% =========== Parte 1: Cargar datos y parámetros =============
m = size(X, 1);

% hacer un vector de parámetros theta
theta_in = [Thetain1(:) ; Thetain2(:)];

%% ===== Parte 2: Computar el Costo con los parámetros iniciales(FP) ======
%  En esta parte del algoritmo debe implementar la función de coste de la red
%  neuronal y probar que su salida sea correcta. Inicialmente puede asumir
%  un costo si regularización

% Factor de regularización
lambda = 0;

J = CosteRedNeuronal(theta_in, n, sl, num_clases,...
                    X, y, lambda);

                
% Comprobar la implementación de la función de coste
fprintf(['Con los valores iniciales Thetain1 y Thetain2'... %f '...
         '\nel valor de la función de coste es: %f'...
         '\n(si su implementación es correcta debe ser 0.287629)\n'], J);
fprintf('Pausa. Presione enter para continuar.\n');
pause;
%% =============== Parte 3: Implementar Regularización ===============
%  Una vez haya comprobado que su función de coste está correctamente
%  implementada, comprobar la implementación de la regularización

fprintf('\nComprobando J con regularización ... \n')

lambda = 1; %utilizaremos incialmente este valor de lambda

J = CosteRedNeuronal(theta_in, n, sl, num_clases,...
                    X, y, lambda);

fprintf(['Para los parámetros theta_in previamente establecidos y con lamda= 1,'...
          '\nel valor de la función de coste es J= %f'...
         '\n(debe ser igual a 0.383770)\n'], J);

fprintf('Pausa. Presione enter para continuar.\n');
pause;


%% ================ Parte 4: Inicialización de Parámetros ================
%  En esta parte del algoritmo debe implementar una función para
%  inicializar aleatoriamente los parámetros de aprendizaje Theta de cada
%  capa

in_Theta1 = InicializarTheta(n, sl);
in_Theta2 = InicializarTheta(sl, num_clases);

% Poner todos los parámetros en un vector
rand_Theta_in = [in_Theta1(:) ; in_Theta2(:)];


% %% ========= Parte 5: Implementar Backpropagation y comprobarlo ==========
% %  Una vez comprobado que funciona la implementación de la función de
% %  coste, implementar el algoritmo de BP para obtener la derivada de la
% %  función de coste y comprobar que funcione correctamente
% %  En esta parte deberá implementar el algoritmo de comprobación del
% %  gradiente por métodos numéricos en la función GradienteNumerico
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
% %% ====== Parte 6: Implementar Regularización para el gradiente ============
% %  Si BP es correcta, continuar implementado regularización
% 
% fprintf('\nComprobando BP con Regularización ... \n')
% 
% %  Comprobar el gradiente de BP con ComprobarGradiente
% lambda = 3;
% ComprobarGradiente(lambda);
% 
% % comprobar tambien la función de coste
% debug_J  = CosteRedNeuronal(theta_in, n, sl, num_clases,...
%                     X, y, lambda);
% 
% fprintf(['\n\nCosto en los parámetros preestablecidos (con lambda=3): %f ' ...
%          '\n(este valor debe ser 0.576051)\n\n'], debug_J);
% 
% fprintf('Pausa. Presione enter para continuar.\n');
% pause;
% %================no se hizo===========

%% =================== Parte 7: Entrenar la RN ===================
%  Una vez hechas las comprobaciones correspondientes, entrenar la red
%  neuronal. Para esto puede utilizar la función fminunc que es un
%  algoritmo de optimización avanzado

fprintf('\nEntrenando la Red Neuronal... \n')

% En este caso vamos a utilizar 100 iteraciones.
load opciones_opt.mat;

%  Debera probar diferentes valores de lambda
lambda = input('Entre valor de lambda= ');
while ~isnumeric(lambda)
    fprintf('\nlambda debe ser un valor numérico');
    lambda = input('Entre valor de lambda= ');
end
it = input('Entre # de iteraciones= ');
while ~isnumeric(it)
    fprintf('\nEl número de iteraciones debe ser un valor numérico');
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

%% ================= Parte 8: Implementar Predicción =================
%  Una vez entrenada la red neuronal, los parámetros Theta nos sirven para
%  predecir nuevos valores que le sean presentados. 
%  En esta parte implementará la función Predecir  para predecir a que 
%  dígito pertenece cada una de las imágenes de los datos de entrenamiento
%  (si hubiera un conjunto de validación, podría utilizarla para predecir
%  la clase de esto datos). A partir de los valores predecidos, puede
%  calcular el rendimiento de la red neuronal
%  Puede utilizar la función PropAdelante para este propósito

pred = PropAdelante(Theta1, Theta2, X);
PredTotal=mean(double(pred == y)) ;

fprintf(['\nPara labmda= ' num2str(lambda) ' y ' num2str(options.MaxIter) ' iteraciones, se obtiene:'])
fprintf('\nPorcentaje de aciertos del conjunto de entrenamiento: %f\n', PredTotal * 100);              