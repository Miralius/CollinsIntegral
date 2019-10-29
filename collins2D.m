function [output] = collins2D(c, d, n2, h1, h2, input, x, y, wavelength, A, B, D)
k=2*pi/wavelength;
hh1=2*c/n2;
u=-c:hh1:c-hh1;
hh2=2*d/n2;
v=-d:hh2:d-hh2;
xx=x'*x;
yy=y'*y;
uu=u'*u;
vv=v'*v;
expXU=exp(((1i*k)/(2*B))*(sqrt(A)*xx-sqrt(D)*uu)^2);
expYV=exp(((1i*k)/(2*B))*(sqrt(A)*yy-sqrt(D)*vv)^2);
integral=input*expXU*expYV*h1*h2;
output=(-(1i*k)/(2*pi*B))*integral;
end