function [ ms_disagree ] = get_msdisagree( v, N )
%GET_MSDISAGREE Summary of this function goes here
%   Detailed explanation goes here

[r c] = size(v);
dif_vg = zeros(1,r);


    
vg_g(1,:)=mean(v(1,:));  
vg_g(2,:)=mean(v(2,:)); 


for k=1:N

    dif_vg(:,k)=norm(vg_g-v(:,k)) .^2;
end
    ms_disagree=mean(dif_vg);
end

