function P = energy_sphere(q,robot)  
    x = zeros(6,6);
    g = 9.8;
    x(1:3,1) = robot.base_1_1;

    x(4:6,1) = robot.base_1_2; 
    
    x(1:3,2) = robot.base_2_1;

    x(4:6,2) = robot.base_2_2; 
    
    P_grav = 0;
    for i = 3:6
        x(1:3,i) = [ q((i-3)*6 + 1)
                     q((i-3)*6 + 2)
                     q((i-3)*6 + 3) ];

        x(4:6,i) = [ q((i-3)*6 + 1) + q((i-3)*6 + 4)
                     q((i-3)*6 + 2) + q((i-3)*6 + 5)
                     q((i-3)*6 + 3) + q((i-3)*6 + 6) ];
        P_grav = P_grav + robot.m(i)*g*(q((i-3)*6 + 3) +  q((i-3)*6 + 6)/2);
    end
    P_ext = transpose(robot.f)*x(1:3,4);
    P_elast = spring_energy(x,1,1,3,1,robot,1) + spring_energy(x,1,1,3,2,robot,2) + spring_energy(x,1,1,5,1,robot,3) + ...
        spring_energy(x,1,1,6,1,robot,4) + spring_energy(x,3,1,6,1,robot,5) + spring_energy(x,3,2,5,1,robot,6) + ...
        spring_energy(x,6,1,1,2,robot,7) + spring_energy(x,5,1,1,2,robot,8) + spring_energy(x,1,2,4,2,robot,9) + ...
        spring_energy(x,1,2,4,1,robot,10) + spring_energy(x,4,2,2,2,robot,11) + spring_energy(x,4,1,2,2,robot,12) + ...
        spring_energy(x,3,2,2,1,robot,13) + spring_energy(x,3,1,2,1,robot,14) + spring_energy(x,2,2,5,2,robot,15) + ...
        spring_energy(x,2,1,5,2,robot,16) + spring_energy(x,2,2,6,2,robot,17) + spring_energy(x,2,1,6,2,robot,18) + ...
        spring_energy(x,6,1,4,1,robot,19) + spring_energy(x,5,1,4,2,robot,20) + spring_energy(x,4,2,5,2,robot,21) + ...
        spring_energy(x,3,2,5,2,robot,22) + spring_energy(x,4,1,6,2,robot,23) + spring_energy(x,3,1,6,2,robot,24);
    P = (P_elast + P_grav + P_ext);

end     