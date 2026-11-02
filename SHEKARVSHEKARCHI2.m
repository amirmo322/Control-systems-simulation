clc;
clear;
close all;

% Parameters
a = 0.6;
b = 0.02;
c = 0.01;
d = 0.3;

% Equilibrium point
xe = 30;
ye = 31.6666667;

% Linearization
A = [a-b*ye, -b*xe;
     c*ye,   c*xe-d];

B = [1; 0];
C = eye(2);
D = zeros(2,1);

% State Space
sys = ss(A,B,C,D);

% Display results
disp('Matrix A =');
disp(A);

disp('Matrix B =');
disp(B);

disp('Poles =');
disp(eig(A));

disp('Transfer Function =');
tf(sys)

% Step Response
% Step Response of both outputs
figure;

[y,t] = step(sys);

plot(t,y(:,1),'b','LineWidth',2);
hold on;
plot(t,y(:,2),'r','LineWidth',2);

grid on;
xlabel('Time (s)');
ylabel('Population Variation');
title('Predator-Prey Linearized System');

legend('out1 - Prey','out2 - Predator');