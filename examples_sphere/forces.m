clc
clear all
close all

d1 = 1;
robot.k = ones(1,24)*100;
robot.d = [d1,d1,d1,d1,d1,d1];
robot.l = ones(1,24)*0.2;
robot.x0 = [0.3,-0.5,0.3,0,1,0,...
    0.3,-0.5,0.6,0,1,0,...
    -0.3,0.3,0.5,1,0,0,...
    -0.3,-0.3,0.5,1,0,0];
robot.m = [1,1,1,1,1,1]*0;
robot.f = [0;0;10]*0;

robot.end_eff.rod = 3;
robot.end_eff.end = 1;

robot.base_1_1 = [0,0,0]';
robot.base_1_2 = [0,0,1]';
robot.base_2_1 = [0.4,0,0]';
robot.base_2_2 = [0.4,0,1]';
robot.energy_f = @energy_sphere;
[p,x2] = forward_kin_tensegrity(robot);
visualize(p,x2,robot)

robot.f = [0;10;0]*10;
[p,x2] = forward_kin_tensegrity(robot);
visualize(p,x2,robot)
