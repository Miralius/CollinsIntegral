function [output] = collinsRadial(radiusOutput, n2, dr, dphi, input, r, phi, wavelength, A, B, D)
k=2*pi/wavelength;
drho=2*radiusOutput/n2;
rho=0:drho:(radiusOutput-drho);
dtheta=2*pi/n2;
theta=0:dtheta:2*pi-dtheta;
rr=r.'*r;
rhorho=rho.'*rho;
if A~=0
    expArr=exp((A*1i*k*rr)/(2*B));
else
    expArr=1;
end
exp2xu=exp(-(1i*k*xu)/B);
exp2yv=exp(-(1i*k*yv)/B);
if D~=0
    expDrhorho=exp((D*1i*k*rhorho)/(2*B));
else
    expDrhorho=1;
end
integral=exp2xu.'*input*expArr*exp2yv*expDrhorho*dr*dphi;
output=(-(1i*k)/(2*pi*B))*integral;
end