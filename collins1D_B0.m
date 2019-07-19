function [u1, Func] = collins1D_B0(u, input, wavelength, C, D)
k=2*pi/wavelength;
if C~=0 || D~=0
    expa=exp(1i*k*C*D*(u.*u)/2);
else
    expa=1;
end
u1=u;
int=input.*expa;
Func=sqrt(D)*int;
end