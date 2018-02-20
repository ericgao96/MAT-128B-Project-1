%  Runs Newton's method to find roots of  f(z) .  It colors the
%  complex plane with 3 colors, depending on which of the 3 roots
%  Newton's method converges to from each starting point.  If Newton's
%  method does not converge, the point is colored white.

f = inline('z^3-1');                    % Define f and f'.
fprime = inline('3*z^2');
root1 = exp(1i*2*pi/3);                   % These are the roots.
root2 = exp(1i*pi*4/3);
root3 = exp(1i*6*pi/3);

colormap([1 0 0;0 1 0; 0 0 1; 1 1 1]);  % Green for root1, Red for root2,
                                        % Blue for root3, White for no convergence.
M = 4*ones(201,201);                    % Initialize array of point colors to 4 (white).

for j=1:201,            % Try initial values with imaginary parts between
  y = -1 + (j-1)*.01;   %  -1 and 1
  for i=1:201,          % and with real parts between
    x = -1 + (i-1)*.01; %  -1 and 1.
    z = x + 1i*y;
    zk = z;
    kount = 0;          % kount is the total number of iterations.
    conv1 = 0;          % conv1,2,3 count iterations when approx soln is within
    conv2 = 0;          %   1.e-6 of root1,2,3.
    conv3 = 0;

    while kount < 40 & conv1 < 5 & conv2 < 5 & conv3 < 5,
      kount = kount + 1;
      zk = zk - f(zk)/fprime(zk);    % This is the Newton step.
      if abs(zk-root1) < 1.e-6,      % Check for convergence to root1.
         conv1 = conv1 + 1;
      else
         conv1 = 0;
      end;
      if abs(zk-root2) < 1.e-6,      % Check for convergence to root2.
         conv2 = conv2 + 1;
      else
         conv2 = 0;
      end;
      if abs(zk-root3) < 1.e-6,      % Check for convergence to root3.
         conv3 = conv3 + 1;
      else
         conv3 = 0;
      end;
    end;

    if conv1 >=3, M(j,i) = 1; end;   % Converged to root 1.  Color point green.
    if conv2 >=3, M(j,i) = 2; end;   % Converged to root 2.  Color point red.
    if conv3 >=3, M(j,i) = 3; end;   % Converged to root 3.  Color point blue.

  end;
end;

image([-1 1],[-1 1],M),        % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.

