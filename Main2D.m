a=5;
b=5;
c=5;
d=5;
sigma=0.5;
wavelength=0.00065;
A=1; B=0; C=0; D=1;
if A*D-B*C~=1
    error ('The determinant of the ABCD matrix must be equal to 1');
end
n=1000;
% n2=2000;
m=5;
% ----------------------------------------------------------
if (B~=0)
    [inputTemp, x, y, h1, h2] = func2D(a, b, n, sigma);
else
    [inputTemp, x, y] = func2D_B0(c, d, n, sigma, D);
end
[input] = func2D_Vortex(inputTemp, m, n, x, y);
% --plots of input function--
figure
image(abs(input),'CDataMapping','scaled');
colormap(gray(255))
figure
image(angle(input),'CDataMapping','scaled');
colormap(gray(255))
% ----------------------------------------------------------
tic
if (B~=0)
    [output] = collins2D_through_cycles(c, d, n, h1, h2, input, x, y, wavelength, A, B, D);
else
    [output] = collins2D_B0(input, x, y, wavelength, C, D);
end
t=toc;
% --plots of output function--
figure
image(abs(output),'CDataMapping','scaled');
colormap(gray(255))
figure
image(angle(output),'CDataMapping','scaled');
colormap(gray(255))