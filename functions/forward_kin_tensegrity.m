function [p,x] = forward_kin_tensegrity(robot)

%Structure robot
%robot.k - array of spring stiffness 
%robot.d - array of rod lengths
%robot.l - array of spring lengths
%robot.x0 - array of init positions 
%robot.m - array of rod mass
%robot.f - external force

%robot.end_eff.rod - number of end effector rod
%robot.end_eff.end - number of end of end effector rod
    options = optimoptions(@fmincon,'MaxIterations',60000,'MaxFunctionEvaluations',60000);
    [x,fval] = fmincon(@(x)robot.energy_f(x,robot),robot.x0,[],[],[],[],[],[],@(x)rod_constr(x,robot),options);
    
    p = [x((robot.end_eff.rod - 3)*6 + 1)
         x((robot.end_eff.rod - 3)*6 + 2)
         x((robot.end_eff.rod - 3)*6 + 3)] + ...
        [x((robot.end_eff.rod - 3)*6 + 4)
         x((robot.end_eff.rod - 3)*6 + 5)
         x((robot.end_eff.rod - 3)*6 + 6)]*...
        (robot.end_eff.end - 1);

end