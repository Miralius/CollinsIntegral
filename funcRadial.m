function [input, r, fi, dr, dFi] = funcRadial(radiusInput, n1, sigma)
dr=2*radiusInput/n1;
r=0:dr:(radiusInput-dr);
dFi=2*pi/n1;
fi=0:dFi:2*pi-dFi;
%--------------------
func=(exp(-(r.*r)))/(2*sigma*sigma);
input=zeros(n1,n1); 
for j=1:n1
  for k=1:n1
    xy_To_r=round(sqrt((j-(n1/2))^2+(k-(n1/2))^2));
    if xy_To_r > n1/2
      input(j,k)=0;
    else 
      input(j,k)=func(xy_To_r);
    end
  end
end
end