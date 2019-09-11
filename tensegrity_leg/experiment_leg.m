clc
clear all
close all

l0 = ones(1,32)*0.1;
x0 = [0,0,0.6,0,0.2,0,...
    0.2,0,0.6,0,0.2,0,...
    0,0.1,-0.1,0.2,0,0,...
    0,0.1,0.4,0.2,0,0,...
    0,0.1,0.8,1,0,0,...
    0.1,0,-0.1,0,0,1,...
    0.1,0.2,-0.1,0,0,1];

[p0,x] = forward_kin(x0,l0);
p_task_2 = p0 + [0.01
    0.0
    0.01];

% [l2,x2] = inverse_kin(p_task_2,l0,x);
% [p,x2] = forward_kin(x2,l2);



fig = figure;
fig.Name = "initial";
hold on;
xlim([-1 1])
ylim([-1 0.5])
zlim([-0.5 1])
campos('manual')
campos([-1,-1,1])
xlabel("x")
ylabel("y")
zlabel("z")
plot3([0,0],[0,0.4],[0,0]);
plot3([0.4,0.4],[0,0.4],[0,0]);
plot3(p0(1),p0(2),p0(3),'r*')
for i = 1:7
    plot3([x((i-1)*6 + 1),x((i-1)*6 + 1) + x((i-1)*6 + 4)],...
        [x((i-1)*6 + 2),x((i-1)*6 + 2) + x((i-1)*6 + 5)],...
        [x((i-1)*6 + 3),x((i-1)*6 + 3) + x((i-1)*6 + 6)]);
end

% fig = figure;
% fig.Name = "final2";
% hold on;
% xlabel("x")
% ylabel("y")
% zlabel("z")
% plot3(p_task_2(1),p_task_2(2),p_task_2(3),'r*')
% plot3([0,0],[0,0.2],[0,0]);
% plot3([0.2,0.2],[0,0.2],[0,0]);
% for i = 1:7
%     plot3([x2((i-1)*6 + 1),x2((i-1)*6 + 1) + x2((i-1)*6 + 4)],...
%           [x2((i-1)*6 + 2),x2((i-1)*6 + 2) + x2((i-1)*6 + 5)],...
%           [x2((i-1)*6 + 3),x2((i-1)*6 + 3) + x2((i-1)*6 + 6)]);
% end
