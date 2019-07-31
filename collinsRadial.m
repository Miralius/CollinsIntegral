function [output] = collinsRadial(radiusOutput, n2, dr, dphi, input, r, phi, wavelength, A, B, D)
k=2*pi/wavelength;
drho=radiusOutput/n2;
rho=0:drho:(radiusOutput-drho);
dtheta=2*pi/n2;
theta=0:dtheta:2*pi-dtheta;
%------
n1=size(r,2);
rMax=r(n1/2)+dr;
dr=rMax/n1;
r=0:dr:(rMax-dr);
%------
rr=r.'*r;
rhorho=rho.'*rho;
if A~=0
    expArr=exp((A*1i*k*rr)/(2*B));
else
    expArr=1;
end
%cos(theta-phi)=cos(theta)*cos(phi)+sin(theta)*sin(phi)
cosThetaPhi=(cos(theta)).'*cos(phi);
sinThetaPhi=(sin(phi)).'*sin(theta);
rrho=r.'*rho;
exp2rrhoCosThetaPhi=exp((1i*k*(rrho.').*cosThetaPhi)/B);
exp2rrhoSinThetaPhi=exp((1i*k*rrho.*sinThetaPhi)/B);
if D~=0
    expDrhorho=exp((D*1i*k*rhorho)/(2*B));
else
    expDrhorho=1;
end
integral=exp2rrhoCosThetaPhi*input*expArr*exp2rrhoSinThetaPhi*dr*dphi;
output=(-(1i*k)/(2*pi*B))*expDrhorho*integral;
end