function [ob,tof,color]=orbit_and_connect(z0)
z=z0;z1=z0;
whether=true;
for i=1:50

    ob(i)=z;
    z=f(z1);
    if abs(z)>100
        whether=false;
        break
    end
    z1=z;

end
if whether==true
    tof='Connected';
else
    tof='Not_connected';
end
x1=i/50;
x2=1-x1;
color=[1 x1 x2];
plot(real(ob),imag(ob),'*','Color',color);





function fx=f(x)
fx=x^2;
return