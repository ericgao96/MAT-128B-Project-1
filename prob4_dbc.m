function fd = prob4_dbc(imageName)
% Differential Box counting
% X=double(imread('rice.tif')); 

X=double(imread(imageName));   

if size(X,1)~=size(X,2)  %Check whetehr M=N
   error('The size of X must NxN.'); 
end

B=size(X,1);temp=B;h=1;N(h)=0;L(h)=0;

while temp>1                % temp=1 means each small grid is a pixel. There is no need to continue.
    temp2=0;
    for i=2:99              % select the value of L
        if mod(temp,i)==0
            L(h)=temp/i;temp=L(h);
            break
        end
    end
   
    for j=1:(B/L(h))       % locate the area of each part of the grid, j is by row, k is by column.
        for k=1:(B/L(h))
            area=X([L(h)*(j-1)+[1:L(h)],L(h)*(k-1)+[1:L(h)]]);
            mn=min(area(1:end));   %minimum gray level
            mx=max(area(1:end));  %maximum gray level
            nr=fix(mx/L(h))-fix(mn/L(h))+1;  %nr(i,j)=l-k+1
            temp2=temp2+nr;
        end
    end
    N(h)=temp2;h=h+1;
end
r=B./L;
p=polyfit(log10(r),log10(N),1);
fd=p(1);