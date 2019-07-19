function [output] = collins2D(c, d, n2, h1, h2, input, x, y, wavelength, A, B, D)
k=2*pi/wavelength;
hh1=2*c/n2;
u=-c:hh1:c-hh1;
hh2=2*d/n2;
v=-d:hh2:d-hh2;
xu=x.'*u;
yv=y.'*v;
xx=x.'*x;
yy=y.'*y;
uu=u.'*u;
vv=v.'*v;
if A~=0
    expAxx=exp((A*1i*k*xx)/(2*B));
    expAyy=exp((A*1i*k*yy)/(2*B));
else
    expAxx=1;
    expAyy=1;
end
exp2xu=exp(-(2*pi*1i*xu)/(wavelength*z));
exp2yv=exp(-(2*pi*1i*yv)/(wavelength*z));
if D~=0
    
end
integral=exp2xu.'*input*expAxx*expAyy*exp2yv*h1*h2;
expuuvv=exp((1i*pi*uu)/(wavelength*z))*exp((1i*pi*vv)/(wavelength*z));
output=(-1i/(wavelength*z))*expuuvv*integral;
end