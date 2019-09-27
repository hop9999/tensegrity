function [] = visualize(p,x,robot)
    hold on
    xlim([-1 1])
    ylim([-1 0.5])
    zlim([-0.5 1])
    campos('manual')
    campos([-1,-1,1])
    plot3(p(1),p(2),p(3),'r*')
    xlabel("x");
    ylabel("y");
    zlabel("z");
    plot3([robot.base_1_1(1),robot.base_1_2(1)],...
          [robot.base_1_1(2),robot.base_1_2(2)],...
          [robot.base_1_1(3),robot.base_1_2(3)]);
    plot3([robot.base_2_1(1),robot.base_2_2(1)],...
          [robot.base_2_1(2),robot.base_2_2(2)],...
          [robot.base_2_1(3),robot.base_2_2(3)]);
    for i = 1:length(x)/6
        plot3([x((i-1)*6 + 1),x((i-1)*6 + 1) + x((i-1)*6 + 4)],...
              [x((i-1)*6 + 2),x((i-1)*6 + 2) + x((i-1)*6 + 5)],...
              [x((i-1)*6 + 3),x((i-1)*6 + 3) + x((i-1)*6 + 6)]);
    end
end