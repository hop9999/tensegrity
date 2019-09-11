function [l,x] = inverse_kin(p_task,l,x)

    [p,x] = forward_kin(x,l);
    err = norm(p_task - p);
    while err > 0.001
        K = jacobian(x,l);
        invK = pinv(K);

        dp = p_task - p;
        dl = transpose(invK * dp);

        l = l + dl;
        [p,x] = forward_kin(x,l);
        err = norm(p_task - p)
    end
end