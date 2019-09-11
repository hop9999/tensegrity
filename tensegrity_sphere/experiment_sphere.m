clc
clear all
close all

l2 = ones(1,24)*0.2;
x0 = [0.3,-0.5,0.3,0,1,0,...
    0.3,-0.5,0.6,0,1,0,...
    -0.3,0.3,0.5,1,0,0,...
    -0.3,-0.3,0.5,1,0,0];

dp = linspace(0,2*pi,41);
dx = 0.1*sin(dp);
dy = 0.1*cos(2*dp);
dz = 0.1*cos(dp);
fig = figure;
campos([-1,-1,1])
h = animatedline;
m = [1,1,1,1,1,1]*3;
[p0,x2] = forward_kin(x0,l2,m);
filename = 'testAnimated.gif';
plot3([0,0],[0,0],[0,0]);
for k = 1:length(dp)
    hold on;
    xlim([-1 1])
    ylim([-1 0.5])
    zlim([0 1])
    campos('manual')
    campos([-1,-1,1])
    p_task_2 = p0 + [dx(k)
        dy(k)
        dz(k)];
    [l2,x2] = inverse_kin(p_task_2,l2,x2,m);
    [p,x2] = forward_kin(x2,l2,m);
    addpoints(h,p_task_2(1),p_task_2(2),p_task_2(3));
    plot3(p0(1) + dx, p0(2) + dy, p0(3) + dz);
    plot3([0,0],[0,0],[0,1]);
    plot3([0.4,0.4],[0,0],[0,1]);
    for i = 1:4
        plot3([x2((i-1)*6 + 1),x2((i-1)*6 + 1) + x2((i-1)*6 + 4)],...
            [x2((i-1)*6 + 2),x2((i-1)*6 + 2) + x2((i-1)*6 + 5)],...
            [x2((i-1)*6 + 3),x2((i-1)*6 + 3) + x2((i-1)*6 + 6)]);
    end
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