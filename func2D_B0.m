function [input, u, v] = func2D_B0(c, d, n2, sigma, D)
hh1=2*c/n2;
u=-c:hh1:c-hh1;
hh2=2*d/n2;
v=-d:hh2:d-hh2;
%--------------------
input1=(exp(-D*(u.*u))).';
input2=(exp(-D*(v.*v)));
input=(input1*input2)/(2*sigma*sigma); %Gauss fan
end