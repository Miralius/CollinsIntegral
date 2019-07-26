radiusInput=5;
radiusOutput=1;
sigma=0.5;
wavelength=0.00065;
A=0; B=100; C=-0.01; D=0;
if A*D-B*C~=1
    error ('The determinant of the ABCD matrix must be equal to 1');
end
n1=1000;
n2=1000;
% ----------------------------------------------------------
if (B~=0)
    [input, r, fi, dr, dFi] = funcRadial(radiusInput, n1, sigma);
% else
%     [input, x, y] = func2D_B0(c, d, n2, sigma, D);
end
% --plots of input function--
figure
image(abs(input),'CDataMapping','scaled');
colormap(gray(255))
figure
image(angle(input),'CDataMapping','scaled');
colormap(gray(255))
% ----------------------------------------------------------
% if (B~=0)
%     [output] = collins2D(c, d, n2, h1, h2, input, x, y, wavelength, A, B, D);
% else
%     [output] = collins2D_B0(input, x, y, wavelength, C, D);
% end
% --plots of output function--
% figure
% image(abs(output),'CDataMapping','scaled');
% colormap(gray(255))
% figure
% image(angle(output),'CDataMapping','scaled');
% colormap(gray(255))