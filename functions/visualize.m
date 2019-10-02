function [] = visualize(p,x,robot)
    hold on
    xlim([-1 1])
    ylim([-1 1])
    zlim([-1 1])
    campos('manual')
    campos([-1,-1,1])
    plot3(p(1),p(2),p(3),'r*')
    xlabel("x");
    ylabel("y");
    zlabel("z");
    n_base = length(robot.base)/6;

    for i = 1:n_base
        plot3([robot.base((i - 1)*6 + 1),robot.base((i - 1)*6 + 4)],...
              [robot.base((i - 1)*6 + 2),robot.base((i - 1)*6 + 5)],...
              [robot.base((i - 1)*6 + 3),robot.base((i - 1)*6 + 6)], 'LineWidth',2);
    end

    for i = 1:length(x)/6
        plot3([x((i-1)*6 + 1),x((i-1)*6 + 4)],...
              [x((i-1)*6 + 2),x((i-1)*6 + 5)],...
              [x((i-1)*6 + 3),x((i-1)*6 + 6)]);
    end
end