a=5;
b=5;
c=1;
d=1;
sigma=0.5;
wavelength=0.00065;
A=1; B=100; C=0; D=1;
if A*D-B*C~=1
    error ('The determinant of the ABCD matrix must be equal to 1');
end
n1=1000;
n2=1000;
% ----------------------------------------------------------
[input, x, y, h1, h2] = func2D(a, b, n1, sigma);
% --plots of input function--
figure
image(abs(input),'CDataMapping','scaled');
colormap(gray(255))
figure
image(angle(input),'CDataMapping','scaled');
colormap(gray(255))
% ----------------------------------------------------------
% [output1] = ft(c, d, n2, h1, h2, input, x, y, B, wavelength);
% [output] = lFr(output1, x, y, wavelength, B);
% --plots of output function--
% figure
% image(abs(output),'CDataMapping','scaled');
% colormap(map)
% figure
% image(angle(output),'CDataMapping','scaled');
% colormap(gray(255))