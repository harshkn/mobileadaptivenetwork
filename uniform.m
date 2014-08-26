function a= uniform( NL )
%UNIFORM Summary of this function goes here
%   a= uniform( NL )


[N,M]=size(NL);
a=zeros(N,N);

for i=1:N
        nk=sum(NL(:,i));
        a(:,i)=NL(:,i)/nk;     
end

end

