function [c,ceq] = confuneq(x)
d = 0.2;
c = [];
ceq = [(d^2 - x(4)^2 - x(5)^2 -x(6)^2),(d^2 - x(10)^2 - x(11)^2 -x(12)^2)];
end     