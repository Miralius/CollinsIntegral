function [input, x, y, h1, h2] = func2D(a, b, n1, sigma)
h1=2*a/n1;
x=-a:h1:a-h1;
h2=2*b/n1;
y=-b:h2:b-h2;
%--------------------
input1=(exp(-(x.*x))).';
input2=(exp(-(y.*y)));
input=(input1*input2)/(2*sigma*sigma); %Gauss fan
end