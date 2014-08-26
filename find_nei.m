function [ NL ] = find_nei(x,no_nei,r_nei)
%FIND_NEI Summary of this function goes here
%   Detailed explanation goes here

A=max(size(x));
dis_xs=zeros(A,A);
NL=eye(A,A);

for k=1:A-1   
for kk=k+1:A 
dis_xs(k,kk)=norm(x(:,k)-x(:,kk));
dis_xs(kk,k)= dis_xs(k,kk);
end
end


for k=1:A
count=0;
    while(sum(NL(:,k))<no_nei && count<A )
    count=count+1;
    [near,ind]=min(dis_xs(:,k));
    if(near<=r_nei)
    NL(ind,k)=1;
    dis_xs(ind,k)=NaN;
    end
    end
end

end
