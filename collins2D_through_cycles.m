function [output] = collins2D_through_cycles(c, d, n2, h1, h2, input, x, y, wavelength, A, B, D)
k=2*pi/wavelength;
hh1=2*c/n2;
u=-c:hh1:c-hh1;
hh2=2*d/n2;
v=-d:hh2:d-hh2;
integral = zeros(n2,n2);
for m = 1:n2
    for n=1:n2
        for p=1:n2
            for l=1:n2
                integral(p,l)=integral(p,l)+input(m,n)*exp(((1i*k)/(2*B))*(A*(x(m)*x(m)+y(n)*y(n))-2*(y(n)*v(l)+x(m)*u(p))+D*(u(p)*u(p)+v(l)*v(l))));
            end
        end
    end
end
output=(-(1i*k)/(2*pi*B))*integral*h1*h2;
end