function [ delta_n ] = getdelta( N, x_n)
%GETDELTA Summary of this function goes here
%   Detailed explanation goes here
r=1;
delta_n = zeros(1,N);



    for k=1:N
        for l=1:N
            if l~=k
            dif_x_n = x_n(l,:)-x_n(k,:);
            
            b=dif_x_n/norm(dif_x_n);
            b1=(norm(dif_x_n)-r)*b;
            
            delta_n(k,:)=sum(b1);
            end
            
        end
    end
    
end

