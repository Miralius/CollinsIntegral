function [output] = func2D_Vortex(input, n, n1, x, y)
angl=zeros(n1, n1);
for j=1:n1
    if j<=n1/2
        angl(j,1:n1) = atan2(-y(j)',x);
    else
        angl(j,1:n1)=atan2(-y(j)',x) + 2*pi;
    end
end %phase diagram

fxy=exp(1i*n*angl);

output=input.*fxy;
end