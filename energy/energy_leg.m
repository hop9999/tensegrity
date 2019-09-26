function P = energy_leg(q,robot)  
    n = length(q)/6;
    g = 9.8;
    x = zeros(6,n + 2);
    
    x(1:3,1) = robot.base_1_1;

    x(4:6,1) = robot.base_1_2; 
    
    x(1:3,2) = robot.base_2_1;

    x(4:6,2) = robot.base_2_2; 
    P_grav = 0;
    for i = 3:n+2
        x(1:3,i) = [ q((i-3)*6 + 1)
                     q((i-3)*6 + 2)
                     q((i-3)*6 + 3) ];

        x(4:6,i) = [ q((i-3)*6 + 1) + q((i-3)*6 + 4)
                     q((i-3)*6 + 2) + q((i-3)*6 + 5)
                     q((i-3)*6 + 3) + q((i-3)*6 + 6) ];
        P_grav = P_grav + robot.m(i)*g*(q((i-3)*6 + 3) +  q((i-3)*6 + 6)/2);
    end
    P_ext = transpose(robot.f)*x(1:3,4);
    P_elast = spring_energy(x,8,1,5,1,robot,1) + spring_energy(x,8,1,1,1,robot,2) + spring_energy(x,8,1,2,1,robot,3) + ...
        spring_energy(x,8,1,5,2,robot,4) + spring_energy(x,9,1,5,1,robot,5) + spring_energy(x,9,1,1,2,robot,6) + ...
        spring_energy(x,9,1,2,2,robot,7) + spring_energy(x,9,1,5,2,robot,8) + spring_energy(x,1,2,6,2,robot,9) + ...
        spring_energy(x,1,1,6,2,robot,10) + spring_energy(x,2,2,6,1,robot,11) + spring_energy(x,2,1,6,1,robot,12) + ...
        spring_energy(x,3,2,6,1,robot,13) + spring_energy(x,3,1,6,1,robot,14) + spring_energy(x,4,2,6,2,robot,15) + ...
        spring_energy(x,4,1,6,2,robot,16) + spring_energy(x,4,2,7,2,robot,17) + spring_energy(x,4,1,7,2,robot,18) + ...
        spring_energy(x,3,2,7,1,robot,19) + spring_energy(x,3,1,7,1,robot,20) + spring_energy(x,8,2,7,1,robot,21) + ...
        spring_energy(x,8,2,3,1,robot,22) + spring_energy(x,8,2,4,1,robot,23) + spring_energy(x,8,2,7,2,robot,24) + ...
        spring_energy(x,9,2,7,1,robot,25) + spring_energy(x,9,2,3,2,robot,26) + spring_energy(x,9,2,4,2,robot,27) + ...
        spring_energy(x,9,2,7,2,robot,28) + spring_energy(x,5,1,1,2,robot,29) + spring_energy(x,5,1,1,1,robot,30) + ...
        spring_energy(x,5,2,2,2,robot,31) + spring_energy(x,5,2,2,1,robot,32) + spring_energy(x,3,1,1,1,robot,33) + ...
        spring_energy(x,3,2,1,2,robot,34) + spring_energy(x,4,2,2,2,robot,35) + spring_energy(x,4,1,2,1,robot,36);
    P = (P_elast + P_grav + P_ext);
end     
