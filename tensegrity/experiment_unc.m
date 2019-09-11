clc
clear all
close all
x0 = [0.1,0.1,0,0,0,0.2,0.1,-0.1,0,0,0,0.2,0,0];
[x,fval] = fminunc(@energy_unc,x0);
x
hold on;
plot3([0,0],[0,0],[0,0.2]);
plot3([x(1),x(1) + x(4)],[x(2),x(2) + x(5)],[x(3),x(3) + x(6)]);
plot3([x(7),x(7) + x(10)],[x(8),x(8) + x(11)],[x(9),x(9) + x(12)]);