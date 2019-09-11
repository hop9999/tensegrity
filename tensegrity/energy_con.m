function P = energy_con(x,l)  

    k = 100;
    
    d = 0.2;
    
    l1 = l(1);
    l2 = l(2);
    l3 = l(3);
    l4 = l(4);
    l5 = l(5);
    l6 = l(6);
    l7 = l(7);
    l8 = l(8);
    l9 = l(9);
    
    x11 = [0
           0
           0];

    x12 = [ 0
            0 
            d ];

    x21 = [ x(1)
            x(2)
            x(3) ];

    x22 = [ x(1) + x(4)
            x(2) + x(5)
            x(3) + x(6) ];

    x31 = [ x(7)
            x(8)
            x(9) ];

    x32 = [ x(7) + x(10)
            x(8) + x(11)
            x(9) + x(12) ];
    
    P = k*(norm(x11-x21)-l1)^2/2 + k*(norm(x21-x31)-l2)^2/2 + k*(norm(x31-x11)-l3)^2/2 +...
            k*(norm(x12-x22)-l4)^2/2 + k*(norm(x22-x32)-l5)^2/2 + k*(norm(x32-x12)-l6)^2/2 +...
            k*(norm(x11-x32)-l7)^2/2 + k*(norm(x31-x22)-l8)^2/2 + k*(norm(x21-x12)-l9)^2/2;
end     