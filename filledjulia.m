%  Computes the filled Julia set (the initial points from which fixed point
%  iteration remains bounded) for the function phi.

phi = inline('z^2 - 1.25');   % Define the function whose fixed points we seek.
fixpt1 = (1 + sqrt(6))/2;     % These are the fixed points.
fixpt2 = (1 - sqrt(6))/2;

colormap([1 0 0; 1 1 1]);     % Points numbered 1 (inside) will be colored red;
                              %   those numbered 2 (outside) will be colored white.
M = 2*ones(71,181);          % Initialize array of point colors to 2 (white).

for j=1:71,                  % Try initial values with imaginary parts between
  y = -.7 + (j-1)*.02;        %   -0.7 and 0.7
  for i=1:181,                % and with real parts between
    x = -1.8 + (i-1)*.02;     %   -1.8 and 1.8.
    z = x + 1i*y;             % 1i is the MATLAB symbol for sqrt(-1).
    zk = z;
    kount = 0;                % kount is the total number of iterations.

    while kount < 30 & abs(zk) < 2,
      kount = kount+1;
      zk = phi(zk);           % This is the fixed point iteration.
    end;

    if abs(zk) < 2,           % If orbit is bounded, set this
      M(j,i) = 1;             %   point color to 1 (red).
    end;

  end;
end;

image([-1.8 1.8],[-.7 .7],M),  % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.