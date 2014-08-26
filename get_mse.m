function [ mse ] = get_mse( vg,v,N )
%GET_MSE Summary of this function goes here
%   Detailed explanation goes here



    
vg_g(1,:)=mean(v(1,:));  
vg_g(2,:)=mean(v(2,:)); 

[r c] = size(vg);
dif_vg = zeros(1,r);



for k=1:N

    dif_vg(:,k)=norm(vg_g-vg(:,k)) .^2;
end
    mse=mean(dif_vg);
end

