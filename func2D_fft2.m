function [input, x, y, h1, h2] = func2D_fft2(a, b, n1, sigma, wavelength, B)
k=2*pi/wavelength;
h1=2*a/n1;
x=-a:h1:a-h1;
h2=2*b/n1;
y=-b:h2:b-h2;
%--------------------
input1=(exp((x.*x)*(((1i*k)/(2*B))-(1/(2*sigma*sigma))))).';
input2=(exp((y.*y)*(((1i*k)/(2*B))-(1/(2*sigma*sigma)))));
input=(input1*input2); %Gauss fan
end