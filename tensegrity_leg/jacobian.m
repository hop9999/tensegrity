function K = jacobian(x0,l)
    n = length(l);
    dl = 0.0001;
    p0 = forward_kin(x0,l);

    K = zeros(3,n);
    for i = 1:n
        l(i)=l(i) + dl;
        p = forward_kin(x0,l);
        l(i)=l(i) - dl;
        dp = (p - p0)/dl;
        K(:,i) = dp;
    end
end