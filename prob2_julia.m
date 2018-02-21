

phi = inline('z^2+0.36+0.1i');  
syms x
eqn=x^2+0.36+0.1i==x;
a = solve(eqn,x);    
fixpt1=a(1);fixpt2=a(2);

colormap([1 0 0; 1 1 1]);     
                              
M = 2*ones(201,201);          

for j=1:201                
  y = -2 + (j-1)*.02;      
  for i=1:201             
    x = -2 + (i-1)*.02;     
    z = x + 1i*y;            
    zk = z;
    kount = 0;               
    
    while kount < 30 & abs(zk) < 2         
      kount = kount+1;
      zk = phi(zk);         
    end

    if abs(zk) < 2           
      M(j,i) = 1;            
    end

  end
end

image([-2 2],[-2 2],M),  
axis xy                        
