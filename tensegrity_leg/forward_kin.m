function [p,x] = forward_kin(x0,l,k)

    [x,fval] = fmincon(@(x)energy_con(x,l,k),x0,[],[],[],[],[],[],@confuneq);

    p = [x(25)
        x(26)
        x(27)];

end