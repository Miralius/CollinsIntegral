function [x, func, h] = func1D(a, sigma, n)
h=2*a/n;
x=-a:h:a-h;
func=exp(-(x.*x)/(2*sigma*sigma));
end