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
robot.base = [0,0,0,...
              0,0,1,...
              0.4,0,0,...
              0.4,0,1];

robot.energy_f = @energy_sphere;

dp = linspace(0,2*pi,41);
dx = 0.1*sin(dp);
dy = 0.1*cos(2*dp);
dz = 0.1*cos(dp);
fig = figure;
campos([-1,-1,1])
h = animatedline;
m = [1,1,1,1,1,1]*3;
[p0,x2] = forward_kin_tensegrity(robot);
filename = 'testAnimated.gif';
plot3([0,0],[0,0],[0,0]);
for k = 1:length(dp)
    p_task_2 = p0 + [dx(k)
               dy(k)
               dz(k)];
    robot = inv_kin_tensegrity(p_task_2,robot);
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