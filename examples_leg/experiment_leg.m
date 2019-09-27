clc
clear all
close all

a1 = 0.1;
a3 = 0.1;
l1 = 0.1;
l2 = 0.2;

robot.l = [0.1,0.1,a3,0.1,...%1-4
    0.1,0.1,a3,0.1,...%5-8
    0.2,0.2,0.4 - a1,0.4- a1,...%9-12
    0.05,0.05,0.05,0.05,...%13-16
    l1,l1,l2,l2,...%17-20
    l2,0.05,0.05,0.05,...%21-24
    l2,0.05,0.05,0.05,...%25-28
    l1,l1,l1,l1,...%29-32
    0.1,0.1,0.1,0.1];%32-36

k1  = 100;

robot.k = [k1,k1,k1,k1,...%1-4
    k1,k1,k1,k1,...%5-8
    k1,k1,k1,k1,...%9-12
    k1,k1,k1,k1,...%13-16
    k1,k1,k1,k1,...%17-20
    k1,k1,k1,k1,...%21-24
    k1,k1,k1,k1,...%25-28
    k1,k1,k1,k1,...%29-32
    k1,k1,k1,k1];%33-36

robot.x0 = [0,0,0.6,0,0.2,0,...
    0.2,0,0.6,0,0.2,0,...
    0,0.1,-0.1,0.2,0,0,...
    0,0.1,0.4,0.2,0,0,...
    0,0.1,0.8,1,0,0,...
    0.1,0,-0.1,0,0,1,...
    0.1,0.2,-0.1,0,0,1];

d1 = 0.8;
d2 = 0.4;
robot.d = [0.2,0.2,d2,d2,d2,d2,d1,d1,d1];
robot.m = [1,1,1,1,1,1,1,1,1]*0;
robot.f = [0;0;10]*0;
robot.active_springs = [3,7,11,12];
robot.end_eff.rod = 7;
robot.end_eff.end = 1;

robot.base_1_1 = [0,0,0]';
robot.base_1_2 = [0,0.2,0]';
robot.base_2_1 = [0.2,0,0]';
robot.base_2_2 = [0.2,0.2,0]';

robot.energy_f = @energy_leg;

dp = linspace(0,2*pi,41);
dx = 0.05*sin(dp);
dy = 0.05*cos(2*dp);
dz = 0.05*cos(dp);
fig = figure;
campos([-1,-1,1])
h = animatedline;
m = [1,1,1,1,1,1]*3;
[p0,x2] = forward_kin_tensegrity(robot);
robot.x0 = x2;
filename = 'testAnimated.gif';
plot3([0,0],[0,0],[0,0]);
for k = 1:length(dp)
    p_task_2 = p0 + [dx(k)
        dy(k)
        dz(k)];

    robot = inv_kin_tensegrity(p_task_2,robot);
    robot.x0 = x2;
    [p,x2] = forward_kin_tensegrity(robot);
    addpoints(h,p_task_2(1),p_task_2(2),p_task_2(3));
    plot3(p0(1) + dx, p0(2) + dy, p0(3) + dz);
    visualize(p,x2,robot)
    drawnow
    % Capture the plot as an image 
      frame = getframe(fig); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if k == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
    hold off;
    plot3([0,0],[0,0],[0,0]);
end