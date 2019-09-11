function [c,ceq] = confuneq(x)
n = length(x)/6;
d1 = 0.5;
d2 = 0.2;
d = [d2,d2,d2,d2,d1,d1,d1];
c = [];
ceq = zeros(1,n);
for i = 1:n
    ceq(i) = (d(i)^2 - x((i-1)*6 + 4)^2 - x((i-1)*6 + 5)^2 -x((i-1)*6 + 6)^2);
end

end