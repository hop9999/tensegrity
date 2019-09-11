function K = jacobian(x0,l,m)
    dl = 0.0001;
    p0 = forward_kin(x0,l,m);

    K = zeros(3,24);
    for i = 1:24
        l(i)=l(i) + dl;
        p = forward_kin(x0,l,m);
        l(i)=l(i) - dl;
        dp = (p - p0)/dl;
        K(:,i) = dp;
    end
end