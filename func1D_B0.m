function [u, func] = func1D_B0(b, sigma, m, D)
hh=2*b/m;
u=-b:hh:b-hh;
func=exp(-D*D*(u.*u)/(2*sigma*sigma));
end