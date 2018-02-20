function [ob,tof]=orbit_and_connect(z0)
z=z0;z1=z0;
whether=true;
for i=1:30

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






function fx=f(x)
fx=x^2;
return