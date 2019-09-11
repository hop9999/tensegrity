function P = energy_con(q,l,m)  
    x = zeros(6,6);
    g = 9.8;
    x(1:3,1) = [ 0
                 0
                 0 ];

    x(4:6,1) = [ 0
                 0
                 1 ]; 
    
    x(1:3,2) = [ 0.4
                 0
                 0 ];

    x(4:6,2) = [ 0.4
                 0
                 1 ]; 
    P_grav = 0;
    for i = 3:6
        x(1:3,i) = [ q((i-3)*6 + 1)
                     q((i-3)*6 + 2)
                     q((i-3)*6 + 3) ];

        x(4:6,i) = [ q((i-3)*6 + 1) + q((i-3)*6 + 4)
                     q((i-3)*6 + 2) + q((i-3)*6 + 5)
                     q((i-3)*6 + 3) + q((i-3)*6 + 6) ];
        P_grav = P_grav + m(i)*g*(q((i-3)*6 + 3) +  q((i-3)*6 + 6)/2);
    end
    P_elast = distance(x,1,1,3,1,l(1)) + distance(x,1,1,3,2,l(2)) + distance(x,1,1,5,1,l(3)) + ...
        distance(x,1,1,6,1,l(4)) + distance(x,3,1,6,1,l(5)) + distance(x,3,2,5,1,l(6)) + ...
        distance(x,6,1,1,2,l(7)) + distance(x,5,1,1,2,l(8)) + distance(x,1,2,4,2,l(9)) + ...
        distance(x,1,2,4,1,l(10)) + distance(x,4,2,2,2,l(11)) + distance(x,4,1,2,2,l(12)) + ...
        distance(x,3,2,2,1,l(13)) + distance(x,3,1,2,1,l(14)) + distance(x,2,2,5,2,l(15)) + ...
        distance(x,2,1,5,2,l(16)) + distance(x,2,2,6,2,l(17)) + distance(x,2,1,6,2,l(18)) + ...
        distance(x,6,1,4,1,l(19)) + distance(x,5,1,4,2,l(20)) + distance(x,4,2,5,2,l(21)) + ...
        distance(x,3,2,5,2,l(22)) + distance(x,4,1,6,2,l(23)) + distance(x,3,1,6,2,l(24));
    
    P = P_elast + P_grav;
end     