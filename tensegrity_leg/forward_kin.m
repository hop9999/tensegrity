function [p,x] = forward_kin(x0,l,k,robot)

    [x,fval] = fmincon(@(x)energy_leg(x,robot),x0,[],[],[],[],[],[],@(x)rod_constr(x,robot));

    p = [x(25)
        x(26)
        x(27)];

end