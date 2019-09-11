function [l,x] = inverse_kin_4(p_task,l,x)
    [p,x] = forward_kin(x,l);
    err = norm(p_task - p);
    while err > 0.001
        K = jacobian_4(x,l)
        invK = pinv(K);

        dp = p_task - p;
        dl = transpose(invK * dp);
        l(9:12) = l(9:12) + dl;
        [p,x] = forward_kin(x,l);
        err = norm(p_task - p)
    end
end