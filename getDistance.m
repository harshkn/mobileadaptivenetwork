function [ d ] = getDistance( target, x , N)
%GETDISTANCE Summary of this function goes here
%   Detailed explanation goes here
%atcparams();
%target = [10, 10];
    for l = 1:N
        d(l,:) = sqrt((target(:,1)-x(l,1)).^2 + (target(:,2)-x(l,2)).^2);    

    end
end

