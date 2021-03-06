a=5;
b=1;
sigma=0.5;
wavelength=0.00065;
A=1; B=100; C=0; D=1;
if A*D-B*C~=1
    error ('The determinant of the ABCD matrix must be equal to 1');
end
n1=1000;
n2=1000;
% -----------------------------
if (B~=0)
    [x, input, h] = func1D(a, sigma, n1);
else
    [x, input] = func1D_B0(b, sigma, n2, D);
end
figure
plot(x,abs(input));
title('Input function � abs')
xlabel('x')
ylabel('abs()')
figure
plot(x,angle(input));
title('Input function � angle')
xlabel('x')
ylabel('angle()')
% -----------------------------
if (B~=0)
    [u, output] = collins1D(b, n2, x, h, input, wavelength, A, B, D);
else
    [u, output] = collins1D_B0(x, input, wavelength, C, D);
end
% --plots of output function--
figure
plot(u,abs(output));
title('Collins 1D � abs')
xlabel('u')
ylabel('abs()')
figure
plot(u,angle(output));
title('Collins 1D � angle')
xlabel('u')
ylabel('angle()')