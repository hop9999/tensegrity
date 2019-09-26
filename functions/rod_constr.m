function [c,ceq] = rod_constr(x,robot)
n = length(robot.d) - 2;
c = [];
ceq = zeros(1,n);
for i = 1:n
    ceq(i) = (robot.d(i+2)^2 - x((i-1)*6 + 4)^2 - x((i-1)*6 + 5)^2 -x((i-1)*6 + 6)^2);
end

end