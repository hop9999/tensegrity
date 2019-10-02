clc
clear all
close all

d1 = 1;
robot.k = ones(1,24)*100;
robot.l = ones(1,24)*0.05;

robot.d = [d1,d1,d1,d1,d1/2,d1/2,d1/2,d1/2];

robot.x0 = [-0.2,0.2,0.0,-0.2,0.2,1,...
            0.2,0.2,0.0,0.2,0.2,1,...
            0.2,-0.2,0.0,0.2,-0.2,1,...
            -0.2,-0.2,0.0,-0.2,-0.2,1,...
            -0.05,0.05,0.5,0.05,0.05,0.5,...
            0.05,-0.05,0.5,-0.05,-0.05,0.5];
        

robot.planes_4_d = [0.1,0.1,0.1,0.1,0.1*sqrt(2),0.1*sqrt(2)];  
robot.m = ones(1,10);
robot.f = [0;0;10]*0;

robot.end_eff.rod = 5;
robot.end_eff.end = 1;

robot.base = [-0.5,0.5,0,...
              -0.5,0.5,1,...
              -0.5,-0.5,0,...
              -0.5,-0.5,1,...
              0.5,-0.5,0,...
              0.5,-0.5,1,...
              0.5,0.5,0,...
              0.5,0.5,1];

robot.energy_f = @energy_stend;

[p,x2] = forward_kin_tensegrity(robot);
visualize(p,x2,robot)


[p,x2] = forward_kin_tensegrity(robot);
visualize(p,x2,robot)
