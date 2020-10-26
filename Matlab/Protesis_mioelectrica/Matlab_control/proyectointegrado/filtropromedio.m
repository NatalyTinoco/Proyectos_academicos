function salida=filtropromedio(entrada,n);
for i=1:length(entrada)-n;
    salida(i)=mean(entrada(1:i+n));
end
salida(length(entrada)-n:length(entrada))=0;
