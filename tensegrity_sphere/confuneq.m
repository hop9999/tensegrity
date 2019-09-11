function [c,ceq] = confuneq(x)
d1 = 1;
d2 = 0.2;
d = [d1,d1,d1,d1,d1,d1];
c = [];
ceq = zeros(1,12);
for i = 1:4
    ceq(i) = (d(i)^2 - x((i-1)*6 + 4)^2 - x((i-1)*6 + 5)^2 -x((i-1)*6 + 6)^2);
end

end