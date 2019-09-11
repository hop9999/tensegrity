function [l,x] = inverse_kin(p_task,l,x,m)

    [p,x] = forward_kin(x,l,m);
    err = norm(p_task - p);
    while err > 0.001
        K = jacobian(x,l,m);
        invK = pinv(K);

        dp = p_task - p;
        dl = transpose(invK * dp);

        l = l + dl;
        [p,x] = forward_kin(x,l,m);
        err = norm(p_task - p);
    end
end