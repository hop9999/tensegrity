clc
clear all
close all

l1 = 0.05;
l2 = 0.2;
l2 = [l1,l1,l1,l1,...%1-4
    l1,l1,l1,l1,...%5-8
    l2,l2,l2,l2,...%9-12
    l1,l1,l1,l1,...%13-16
    l1,l1,l2,l2,...%17-20
    l2,l1,l1,l1,...%21-24
    l2,l1,l1,l1,...%25-28
    l1,l1,l1,l1,...%29-28
    0.6,0.6,0.6,0.6];%29-32

x0 = [0,0,0.6,0,0.2,0,...
    0.2,0,0.6,0,0.2,0,...
    0,0.1,-0.1,0.2,0,0,...
    0,0.1,0.4,0.2,0,0,...
    0,0.1,0.8,1,0,0,...
    0.1,0,-0.1,0,0,1,...
    0.1,0.2,-0.1,0,0,1];

[p0,x2] = forward_kin(x0,l2);
dp = linspace(0,2*pi,41);
dx = 0.1*cos(dp) -0.1;
dy = 0.05*cos(2*dp);
dz = 0.1*sin(dp)+0.1;

fig = figure;
campos([-1,-1,1])
h = animatedline;
filename = 'testAnimated.gif';
plot3([0,0],[0,0],[0,0]);

for k = 1:length(dp)
    hold on;
    xlim([-1 1])
    ylim([-1 0.5])
    zlim([-0.5, 1])
    campos('manual')
    campos([-1,-1,1])
    xlabel("x")
    ylabel("y")
    zlabel("z")
    p_task_2 = p0 + [dx(k)
        dy(k)
        dz(k)];
    [l2,x2] = inverse_kin_4(p_task_2,l2,x2);
    [p,x2] = forward_kin(x2,l2);
    addpoints(h,p_task_2(1),p_task_2(2),p_task_2(3));
    plot3(p0(1) + dx, p0(2) + dy, p0(3) + dz);
    plot3(p_task_2(1),p_task_2(2),p_task_2(3),'r*')
    plot3([0,0],[0,0.4],[0,0]);
    plot3([0.4,0.4],[0,0.4],[0,0]);
    for i = 1:7
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