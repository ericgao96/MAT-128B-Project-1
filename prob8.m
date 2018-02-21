function prob8(iter,pixel)


switch nargin
    case 0
        iter=23;
        pixel=400;
end

r = 3/4; 
x = linspace(-2.5,1.5,pixel);
y = linspace(-1.5,1.5,round(pixel*r))';

[Re,Im] = meshgrid(x,y);
C = Re + i * Im;

B = zeros(round(pixel*r),pixel);

Cn = B;             
for l = 1:iter
    Cn = Cn.*Cn + C;       
    B = B + (abs(Cn)<2);   
end;


imagesc(B);
colormap(jet);

axis equal
axis off
