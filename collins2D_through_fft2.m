function [output] = collins2D_through_fft2(c, d, n2, input, wavelength, B, D)
k=2*pi/wavelength;
hh1=2*c/n2;
u=-c:hh1:c-hh1;
hh2=2*d/n2;
v=-d:hh2:d-hh2;
expAu2_v2=((exp((1i*D*k*(u.*u))/(2*B))).'*(exp((1i*D*k*(v.*v))/(2*B))));
output=(-(1i*k)/(2*pi*B))*expAu2_v2.*fft2(input);
end