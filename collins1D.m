function [u, Func] = collins1D(b, m, x, h, input, wavelength, A, B, D)
k=2*pi/wavelength;
hh=2*b/m;
u=-b:hh:b-hh;
xu=x.'*u;
xx=x.'*x;
uu=u.'*u;    
if (A~=0)
    expAxx=exp(((1i*k)/(2*B))*(A*xx));
else
    expAxx=1;
end
exp2xu=exp(((1i*k)/(2*B))*(-2*xu));
if (D~=0)
    expDuu=exp(((1i*k)/(2*B))*(D*uu));
else
    expDuu=1;
end
expa=expAxx*exp2xu*expDuu;
int=input*expa*h;
Func=sqrt(-(1i*k)/(2*pi*B))*int;
end