clc;
clear;
close all;

%% Parameters
a = 0.6;
b = 0.02;
c = 0.01;
d = 0.3;

%% Step Input
u = @(t) (t >= 0);

%% Initial Conditions
x0 = 8;
y0 = 8;

%% Differential Equations
f = @(t,z) [
    a*z(1) - b*z(1)*z(2) + u(t);
    c*z(1)*z(2) - d*z(2)
];

%% Simulation
tspan = [0 200];

[t,z] = ode45(f,tspan,[x0 y0]);

x = z(:,1);
y = z(:,2);

%% Plot Population
figure;
plot(t,x,'b','LineWidth',2);
hold on;
plot(t,y,'r','LineWidth',2);
grid on;

xlabel('Time (s)');
ylabel('Population');
title('Predator-Prey System with Step Input');

legend('Prey x(t)','Predator y(t)');

%% Calculate Derivatives
dx = 0.6*x - 0.02*x.*y + 1;
dy = 0.01*x.*y - 0.3*y;

%% Plot x'(t)
figure;
plot(t,dx,'LineWidth',2);
grid on;
xlabel('Time (s)');
ylabel('dx/dt');
title('Response of x''(t)');

%% Plot y'(t)
figure;
plot(t,dy,'LineWidth',2);
grid on;
xlabel('Time (s)');
ylabel('dy/dt');
title('Response of y''(t)');