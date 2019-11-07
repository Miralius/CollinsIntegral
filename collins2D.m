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
exp2xu=exp(-(1i*k*xu)/B);
exp2yv=exp(-(1i*k*yv)/B);
if D~=0
    expDuu=exp((D*1i*k*uu)/(2*B));
    expDvv=exp((D*1i*k*vv)/(2*B));
else
    expDuu=1;
    expDvv=1;
end
integral=exp2yv.'*input*(expAxx.'*expAyy)*exp2xu*(expDuu.'*expDvv)*h1*h2;
output=(-(1i*k)/(2*pi*B))*integral;
end