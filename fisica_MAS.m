clc
clear
%El movimiento viene dado por
% d²x/dt² = -x
% d²y/dt² = -y
%para t=0
% dx(t=0)/dt = 1, x(t=0) = 0
% dy(t=0)/dt = 0, y(t=0) = 1

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
%realizamos el bucle para el metodo integracion de Euler implicito
i = 2;
while i<=1000
    %velocidad-tiempo
    t(i) = t(i-1) + h;%x_n
    t1 = linspace(t(i-1),t(i),20);
    x_r(i) = x_r(i-1) + h*v_x(i-1); %y_n
    v_x(i) = v_x(i-1) + h*((-1)*x_r(i-1));%y_n
    v_x1 = linspace(v_x(i-1),v_x(i),20);
    %Representar gráficamente x(t) frente a y(t).
    plot(t1,v_x1,'b')
    hold on
    y_r(i) = y_r(i-1) + h*v_y(i-1); %y_n
    v_y(i) = v_y(i-1) + h*((-1)*y_r(i-1)); %y_n
    v_y1 = linspace(v_y(i-1),v_y(i),20);
    %Representar gráficamente x(t) frente a y(t).
    plot(t1,v_y1,'r')
    i = i+1;
end
