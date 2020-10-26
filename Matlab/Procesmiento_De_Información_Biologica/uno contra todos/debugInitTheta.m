function W = debugInitTheta(salidas, entradas)
% Inicializa los pesos de una capa con entradas y salidas determinadas por 
% las variables del mismo nombre 

% Definir la dimensi�n de W
W = zeros(salidas, 1 + entradas); % el t�rmino entradas + 1  tiene en 
                                  % cuenta la unidad del intercepto

% Inicializar W usando la funci�n seno de manera que todos los valores
% est�n en el mismo rango

W = reshape(sin(1:numel(W)), size(W)) / 10;

% =========================================================================

end
