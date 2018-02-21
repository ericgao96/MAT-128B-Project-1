

f = inline('z^3-1');                    
fprime = inline('3*z^2');
root1 = exp(1i*2*pi/3);                   
root2 = exp(1i*pi*4/3);
root3 = exp(1i*6*pi/3);

colormap([1 0 0;0 1 0; 0 0 1; 1 1 1]);  
                                        
M = 4*ones(201,201);                   

for j=1:201,          
  y = -1 + (j-1)*.01;  
  for i=1:201,         
    x = -1 + (i-1)*.01;
    z = x + 1i*y;
    zk = z;
    kount = 0;         
    conv1 = 0;         
    conv2 = 0;         
    conv3 = 0;

    while kount < 40 & conv1 < 5 & conv2 < 5 & conv3 < 5,
      kount = kount + 1;
      zk = zk - f(zk)/fprime(zk);   
      if abs(zk-root1) < 1.e-6,      
         conv1 = conv1 + 1;
      else
         conv1 = 0;
      end;
      if abs(zk-root2) < 1.e-6,      
         conv2 = conv2 + 1;
      else
         conv2 = 0;
      end;
      if abs(zk-root3) < 1.e-6,     
         conv3 = conv3 + 1;
      else
         conv3 = 0;
      end;
    end;

    if conv1 >=3, M(j,i) = 1; end;   
    if conv2 >=3, M(j,i) = 2; end;   
    if conv3 >=3, M(j,i) = 3; end;   

  end;
end;

image([-1 1],[-1 1],M),       
axis xy                       

