%c = randi
c = .365+1i*.5;
jlist=[];  %creat an array to store the point in the boundary
for j=1:201                 % Try initial values with imaginary parts between
  y = -2 + (j-1)*.02;        %   -2 and 2
  for k=1:201             % and with real parts between
    x = -2 + (k-1)*.02;     %   -2 and 2
    z = x + 1i*y;             % 1i is the MATLAB symbol for sqrt(-1).
    kount = 0;
    zk = z;
    
    while kount < 101
        kount = kount+1;
        zk = zk - c;
        X = real(zk);
        Y = imag(zk);
        r = sqrt(X*X+Y*Y);
        theta = atan2(Y,X);
        zk = sqrt(r) * cos(theta/2) + sqrt(r) * 1i * sin(theta/2);
        
           a= randi(50,1,1);
             if mod(a, 2) == 1
                 zk = zk;
             else
               zk = -zk;
    
             end;
    end;

    jlist=[jlist, zk]; 

    
  end
end

  

plot(jlist, '.')
pbaspect([1 1 1]);
axis xy                        % If you don't do this, vertical axis is inverted.