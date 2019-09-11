function [p,x] = forward_kin(x0,l)

    [x,fval] = fmincon(@(x)energy_con(x,l),x0,[],[],[],[],[],[],@confuneq);

    p = [x(1)
        x(2)
        x(3)];

end