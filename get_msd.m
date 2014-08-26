function [ msd_val ] = get_msd( N ,w_act, w )
%MSD Summary of this function goes here
%   Detailed explanation goes here

[r c] = size(w);
temp = zeros(1,r);
    for l=1:N
        temp(l) = norm(pdist([w_act(1,:);w(l,:)])) .^ 2   ; 
    end
    
    msd_val=sum(temp)/N;
       

end

