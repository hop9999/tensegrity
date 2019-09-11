function K = jacobian_4(x0,l)
    n = length(l);
    dl = 0.0005;
    p0 = forward_kin(x0,l);
    index = [9,10,11,12];
    K = zeros(3,4);
    for i = 1:4
        l(index(i))=l(index(i)) + dl;
        p = forward_kin(x0,l);
        l(index(i))=l(index(i)) - dl;
        dp = (p - p0)/dl;
        K(:,i) = dp;
    end
end