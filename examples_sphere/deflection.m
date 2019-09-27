clc
clear all
close all

d1 = 1;
d2 = 0.2;
robot.k = ones(1,24)*100;
robot.d = [d1,d1,d1,d1,d1,d1];
robot.l = ones(1,24)*0.2;
robot.x0 = [0.3,-0.5,0.3,0,1,0,...
    0.3,-0.5,0.6,0,1,0,...
    -0.3,0.3,0.5,1,0,0,...
    -0.3,-0.3,0.5,1,0,0];
robot.m = [1,1,1,1,1,1]*0;
robot.f = [0;0;10]*0;
robot.active_springs = [10,12,19,23];
robot.end_eff.rod = 4;
robot.end_eff.end = 1;
robot.base_1_1 = [0,0,0]';
robot.base_1_2 = [0,0,1]';
robot.base_2_1 = [0.4,0,0]';
robot.base_2_2 = [0.4,0,1]';

robot.energy_f = @energy_sphere;

[p0,x2] = forward_kin_tensegrity(robot);
n = 2;
0;
dy = linspace(-0.05,0.05,n);
dz = linspace(-0.05,0.05,n);
x_d = p0(1) + dy
y_d = p0(2) + dy*0
z_d = p0(3) + dz

def = zeros(n,n);
for i = 1:n
    for j = 1:n
        robot.f = [0;0;10]*0;
        robot = inv_kin_tensegrity([x_d(i);y_d(i);z_d(j)],robot);
        robot.f = [0;0;10];
        [p1,x2] = forward_kin_tensegrity(robot);
        d(i,j) = norm([x_d(i);y_d(i);z_d(j)] - p1)
    end
end
contourf(d');

