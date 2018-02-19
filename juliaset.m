%  Computes the filled Julia set (the initial points from which fixed point
%  iteration remains bounded) for the function phi.

phi = inline('sqrt(z-0)');   % Define the function whose fixed points we seek.
syms x
eqn=x^2==x;
a = solve(eqn,x);     % These are the fixed points.
%fixpt1=a(1);fixpt2=a(2);

colormap([1 0 0; 1 1 1]);     % Points numbered 1 (inside) will be colored red;
                              %   those numbered 2 (outside) will be colored white.
M = 2*ones(201,201);          % Initialize array of point colors to 2 (white).

for j=1:201                 % Try initial values with imaginary parts between
  y = -2 + (j-1)*.02;        %   -2 and 2
  for i=1:201              % and with real parts between
    x = -2 + (i-1)*.02;     %   -2 and 2
    z = x + 1i*y; % 1i is the MATLAB symbol for sqrt(-1).
    r = sqrt(x^2+y^2);
    theta = atan(y/x);
    zk = sqrt(r * cos(theta/2) + sqrt (r * sin(theta/2)));
    kount = 0;                % kount is the total number of iterations.

    while kount < 30 %& abs(zk) < 2
      kount = kount+1;
      zk = phi(zk);           % This is the fixed point iteration.
    end
       
    X = imag(zk);
    Y = real(zk);
    
    %if abs(zk) < 2           % If orbit is bounded, set this
     %M(j,i) = 1;             %   point color to 1 (red).
     %end
    M(Y,X) = 1;
     
  end
end

image([-2 2],[-2 2],M),  % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.