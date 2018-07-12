clear all
clc

%Avion en vuelo circular horizontal a una altura constante h
%Tomamos w como velocidad angular
%Tomamos R como el radio
%Tomamos h como la altura
%Tomamos t como el tiempo
%Tomamos O como el angulo teta


%Definimos los valores de las distintas variables
figure(1)
h = 1;
R = 1;
w = 0.3;
%O ira desde 0 a 2pi
O = linspace(0,2*pi,100);
i = 1;
while i <=100
    %definimos el tiempo en funcion del angulo teta y la velocidad angular
    %Q = w*t
    t1 = O(i)/w;
    t = linspace(0,t1,100);
    %Las coordenadas x, y, z
    x = R*cos(w*t);
    y = R*sin(w*t);
    z = h *ones(1,100);
    %Grafica 3D
    plot3(x,y,z)
    hold on
    i = i+1;
end
title('Trayectoria del avion')
xlabel('Eje x')
ylabel('Eje y')
zlabel('Eje z')

%buscamos los vectores de la velocidad
%x = R*cos(w*t)
%y = R*sen(w*t)
%z = h
%r(x,y,z)
%Velocidad = V = dr/dt=(dx/dt,dy/dt,dz/dt) = (-w*R*sen(w*t),w*R*cos(w*t),0)
figure(2)
k = 1;
while k<=100
    %V = dr/dt=(dx/dt,dy/dt,dz/dt)
    t = O(k)/w;
    %t = linspace(0,t1,100);
    velocidad_x = (-1)*w*R*sin(w*t);
    velocidad_y = w*R*cos(w*t);
    velocidad_z = 0;
    %el vector de velocidad
    velocidad = [velocidad_x  velocidad_y velocidad_z];
    %modulo de la velocidad
    modulo = norm(velocidad);
    plot(t,modulo,'x')
    hold on
    k = k+1;
end
title('Modulo-Tiempo del avion')
xlabel('Tiempo')
ylabel('Modulo')

%Planeador en vuelo circula en una corriente terminca ascendente de
%pendiente alfa

% tomamos Q = alfa, sera la pendiente
% usaremos h, t, R y w de antes
figure(3)
Q = 45; %Q representa alfa
O1 = linspace(0,3*pi,100);
j = 1;
while j<=100
    %definimos el tiempo en funcion del angulo teta y la velocidad angular
    %Q = w*t
    t1 = O1(j)/w;
    t = linspace(0,t1,100);
    %Las coordenadas x, y, z
    x = R*cos(w*t);
    y = R*sin(w*t);
    z = R*w*t*tan(Q);
    %Grafica 3D
    plot3(x,y,z)
    hold on
    grid on
    j = j +1;
end
view(70,30)
title('Trayectoria del planeador')
xlabel('Eje x')
ylabel('Eje y')
zlabel('Eje z')

%vectores de velocidad
%x = R*cos(w*t)
%y = R*sin(w*t)
%z = R*w*t*tan(Q)
%r=(x,y,z)
% Velocidad = V = dr/dt=(dx/dt,dy/dt,dz/dt) = (-w*R*sen(w*t),w*R*cos(w*t),R*w*tan(Q))
figure(4)
k = 1;
while k<=100
    t = O(k)/w;
    %t = linspace(0,t1,100);
    %V = dr/dt=(dx/dt,dy/dt,dz/dt)
    velocidad_x = (-1)*w*R*sin(w*t);
    velocidad_y = w*R*cos(w*t);
    velocidad_z = R*w*tan(Q);
    %el vector de velocidad
    velocidad = [velocidad_x  velocidad_y velocidad_z];
    %modulo de la velocidad
    modulo = norm(velocidad);
    plot(t,modulo,'x')
    hold on
    k = k+1;
end
title('Modulo-tiempo del planeador')
xlabel('Tiempo')
ylabel('Modulo')
