clc
clear

%integrar numericamente este sistema, movimiento armonico simple
%Comenzamos con el tiempo = 0 segundos
t = [0];
%paso de integracion
h = 0.001;
%posicion inicial, x=0
x_r = [0];
y_r = [1];
%velocidad inicial, v = 0
v_x = [1];
v_y = [0];

radio = 42174;
%segundos que tarda en dar una vuelta
vuelta = 6;
%diez vueltas
diez_vueltas = 10*vuelta;
auxiliar_bucle = 0;
%realizamos el bucle para el metodo integracion de Euler implicito
i = 2;
while auxiliar_bucle <diez_vueltas
    %paso de integracion
    h = 0.001;
    %nuevo paso de integracion para el error
    hi =  h/i;
    %velocidad-tiempo
    t(i) = t(i-1) + h;
    x_r(i) = x_r(i-1) + h*v_x(i-1);%y_n para x
    v_x(i) = v_x(i-1) + h*((-1)*x_r(i-1));%y_n para x
    y_r(i) = y_r(i-1) + h*v_y(i-1); %y_n para y
    v_y(i) = v_y(i-1) + h*((-1)*y_r(i-1)); %y_n para y
    
    %Elegir adecuadamente el paso de integración para que, suponiendo que el
    %movimiento se corresponde con una orbita circular de radio a=42174 km, el error en
    %la posición después de 10 vueltas sea menor que 0.5 km.
    Error1 = 1-((x_r(i)).^2+(y_r(i)).^2); %error generado por una orbita circular
    Error = radio-(Error1+radio);
    %auxiliar para la salida del bucle despues de 10 vueltas
    auxiliar_bucle = t(i);
    i = i+1;
end
Error1
Paso_de_integracion=hi
Error
