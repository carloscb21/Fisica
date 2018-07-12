clear all
close all

%La trayectoria de un proyectil se expresa por:
%y=-5(t-5)²+125

%1. Reprentar la funcion desde t=0s a t=10s
figure(1)
t = 0:0.1:10;
y = -5 *(t-5).^2 + 125;
plot(t,y)

%Determinar la velocidad media para intervalos de 1s desde t=0s a t=10s
figure(2)
hold on
i = 1; %cada segundo, 1s.
n=20; %discretizacion
while i<=10
    velocidadMedia= (-5 *(i-5).^2 + 125-(-5 *((i-1)-5).^2 + 125)/(i-(i-1)))
    Int=linspace(i-1,i,n)
    VM=velocidadMedia*ones(1,n)
    plot(Int,VM,'r')
    i = i +1;
end

%Velocidad instantanea en funcion de t
figure(3)
%derivada
y_derivada = (-5)*(2*t - 10);
plot(t,y_derivada)

%Velocidad media en funcion de t
figure(4)
hold on
j = 1;
n=20; %discretizacion
while j<=10
    velocidadMedia= (((-5)*(2*j - 10)-((-5)*(2*(j-1) - 10)))/(j-(j-1)));
    Int=linspace(j-1,j,n);
    VM=velocidadMedia*ones(1,n);
    plot(Int,VM,'r')
    j = j +1;
end
