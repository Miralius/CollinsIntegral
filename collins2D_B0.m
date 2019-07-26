function [Func] = collins2D_B0(input, u, v, wavelength, C, D)
k=2*pi/wavelength;
if C~=0 || D~=0
    uv=u+v;
    expa=exp(1i*k*C*D*(uv.'*uv)/2);
else
    expa=1;
end
int=input.*expa;
Func=sqrt(D)*int;
end