function [p,x] = forward_kin(x0,l,m)

    [x,fval] = fmincon(@(x)energy_con(x,l,m),x0,[],[],[],[],[],[],@confuneq);

    p = [x(7)
        x(8)
        x(9)];

end