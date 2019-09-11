function d = distance(x,a1,a2,b1,b2,l)
    k = 100;
    x1 = x((a2-1)*3+1:a2*3,a1)
    x2 = x((b2-1)*3+1:b2*3,b1)
    d = k*(norm(x1-x2)-l)^2/2;
end