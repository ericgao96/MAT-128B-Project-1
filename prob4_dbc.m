function fd = prob4_dbc(X)
% Differential Box counting
% Example: 
%    X=double(imread('rice.tif')); 
%    fd=box_frac_dem(X); 

if size(X,1)~=size(X,2)  %Check whetehr M=N
   error('The size of X must NxN.'); 
end 
B=size(X,1); 
if mod(log2(B),1)>0
   error('The size of X must 2^n'); % as what error says
end 
t=log2(B); %Suppose the size of image is 256*256£¬then t = 8
s=2.^(1:t); % s = 2,4,8,16,32,64,128,256 get 2's power
Nr=zeros(1,t); % nr = 0     0     0     0     0     0     0     0
for k=1:t 
   d=s(k);   %set the size of different windows
   h=B/d; % Let B instead of 256 for the size [2^nX2^n] 
   for m=1:h
       for n=1:h 
           A=X(d*(m-1)+[1:d],d*(n-1)+[1:d]);  
           mn=min(A(1:end));   %minimum gray level
           mx=max(A(1:end));  %maximum gray level
           nr=fix(mx/d)-fix(mn/d)+1;  %nr(i,j)=l-k+1
           Nr(k)=Nr(k)+nr; 
       end 
   end 
end 
r=B./s; 
p=polyfit(log10(r),log10(Nr),1); %least square linear fit
fd=p(1); 