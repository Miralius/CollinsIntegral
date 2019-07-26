function [input, r, fi, dr, dFi] = funcRadial(radiusInput, n1, sigma)
dr=radiusInput/n1;
r=0:dr:radiusInput-dr;
dFi=2*pi/n1;
fi=0:dFi:2*pi-dFi;
%--------------------
func=(exp(-(r.*r)))/(2*sigma*sigma);
input=zeros(2*n1-1,2*n1-1); 
for j=1:(2*n1-1)
  for k=1:(2*n1-1)
    r=round(sqrt((j-n1)^2+(k-n1)^2)+1);
    if r>n1
      input(j,k)=0;
    else 
      input(j,k)=func(r);
    end
  end
end
end