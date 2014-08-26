function [ amatrix ] = getamatrix( neighbor )
%getamatrix Summary of this function goes here
%   Detailed explanation goes here

len = size(neighbor, 1); %get the num of nodes
c = transpose(1./sum(neighbor == 1));
crep = repmat(c,1,len); %duplicate for making matrix mult possible
amatrix = crep .* neighbor;
end

