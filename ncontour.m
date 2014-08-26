function [ ] = contour( )
%CONTOUR Summary of this function goes here
%   Detailed explanation goes here
    
ku = 0.01;
wo= [100 ;100];
M = 2
for xx=1:200
         for yy=1:200


              CC(:,:)=ku*norm(wo-[xx;yy])^2*eye(M,M);
              z(xx,yy)=trace(CC(:,:));
              if(xx<100 && xx>0 && yy<100 && yy>0)

                z(xx,yy)=z(xx,yy)+1000*(exp(-(xx-25).^2/100).*exp(-(yy-50).^2/100))/sqrt(2*pi);

              end
         end


        
end


surf (10*log10(z));
hold on;
contour(10*log10(z))


end

