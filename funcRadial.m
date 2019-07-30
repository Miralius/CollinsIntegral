function [input, r, phi, dr, dphi] = funcRadial(radiusInput, n1, sigma)
dr=2*radiusInput/n1;
r=0:dr:(radiusInput-dr);
dphi=2*pi/n1;
phi=0:dphi:2*pi-dphi;
%--------------------
func=(exp(-(r.*r)))/(2*sigma*sigma);
input=zeros(n1,n1);
for j=1:n1
  for k=1:n1
%     if j<n/2
%         fi=atan2(n1-k, j-n1);
%     else 
%         fi=atan2(n1-k, j-n1) + 2*pi;
%     end
    xy_To_r=round(sqrt((j-(n1/2))^2+(k-(n1/2))^2)+1);
    if xy_To_r > n1/2
      input(j,k)=0;
    else 
      input(j,k)=func(xy_To_r);
    end
  end
end
end