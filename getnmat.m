function [ nl ] = getnmat(x, M, N, rmax)
%getNeigbors Summary of this function goes here
%   Detailed explanation goes here
%x - position matrix
%dimension - set to 2 by default

distmatrix = zeros(M,N);


for k = 1:N
    for l= 1:N
        distmatrix(k,l) = pdist([x(k,:);x(l,:)]);
    end
end

nl = distmatrix <= rmax;

end



