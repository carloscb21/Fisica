clear all
clc

%ecuacion del movimiento de la boya es:


%Obtener la velocidad instantánea de la boya aplicando el método de Euler entre los instantes de
%tiempo ti=0 y tf=10 segundos. Suponemos que la boya parte del reposo en el instante inicial.
%Comprobar gráficamente que la velocidad tiende asintóticamente a una velocidad límite, cuya
%magnitud es k/alfa.

%tenemos los datos
r=0.1;
m_lu=10;%magnitud lu
densidad=760;
volumen = 4/3*pi*r^3;
%masa de la boya
masa= densidad*volumen;
P_fluido = 1.4; %densidad del fluido
gravedad = 9.8;
alfa = 6*pi*r*m_lu;
h = 0.01;
k = masa*gravedad-volumen*P_fluido*gravedad; %fuerza de flotabilidad
t = zeros(1,1001);
v = zeros(1,1001);
tiempo = t(1)
velocidad = v(1)
%ejecutamos el metodo recursivo de Euler
for n=2:1:1001
    t(n)=t(n-1)+h; %x_n
    t1 = linspace(t(n-1),t(n),20);
    v(n)=v(n-1)+h*(k-(alfa*v(n-1)))/masa; %y_n, viene de m*dv/dt=k-alfa*v
    v1 = linspace(v(n-1),v(n),20);
    tiempo = t(n-1)
    velocidad = v(n-1)
    plot(t1,v1,'b')
    hold on
end
tiempo = t(1001)
velocidad = v(1001)

%Obtener analíticamente la ecuación de la velocidad como función del tiempo, verificando que el
%módulo de la velocidad límite tiende a k/alfa. Comparar gráficamente con la aproximación numérica
%anterior. Estudiar el error cometido.
%Apartado B
t_B = zeros(1,1001);
v_B = zeros(1,1001);
tiempo_B = t_B(1);
velocidad_B = v_B(1);
for k=2:1:1001
    t_B(k)=t(k-1)+h;%x_n
    t2 = linspace(t_B(k-1),t_B(k),20);
    v_B(k)=v(k-1)+h*(k/alfa*(1-(1/k)*exp((-1)*alfa*masa*t_B(k))));%y_n, resolviendo la ecuacion diferencial m*dv/dt=k-alfa*v
    v2 = linspace(v_B(k-1),v_B(k),20);
    plot(t2,v2,'r')
    hold on
end
xlabel('Tiempo')
ylabel('Velocidad')
gtext('se puede ver que el error incrementa apartir de t=1, hasta alcanzar un error maximo de 0.5')

