a=10;
b=10;
c=10;
d=10;
sigma=0.5;
wavelength=0.00065;
A=1; B=100; C=0; D=1;
if A*D-B*C~=1
    error ('The determinant of the ABCD matrix must be equal to 1');
end
n=2000;
% n2=2000;
m=7.3;
% ----------------------------------------------------------
if (B~=0)
%     [inputTemp, x, y, h1, h2] = func2D(a, b, n, sigma);
    [inputTemp, x, y, h1, h2] = func2D_fft2(a, b, n, sigma, wavelength, B);
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
%     [output] = collins2D(c, d, n, h1, h2, input, x, y, wavelength, A, B, D);
    [output] = collins2D_through_fft2(c, d, n, input, wavelength, B, D);
else
    [output] = collins2D_B0(input, x, y, wavelength, C, D);
end
t=toc;
% --plots of output function--
figure
image(abs(fftshift(output)),'CDataMapping','scaled');
colormap(gray(255))
figure
imagesc(angle(output),'CDataMapping','scaled');
colormap(gray(255))