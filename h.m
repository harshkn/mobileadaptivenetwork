function [ out ] = h( w,x ,s)
%H Summary of this function goes here
%   [ out ] = h( w,x ,s,wo) for just one item...

l=norm(w-x);

if l>s
    out=s*(w-x)/l;
else
    out=w-x;

end

end

