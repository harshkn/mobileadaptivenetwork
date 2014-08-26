function gama= Gama( NL )
%UNIFORM Summary of this function goes here
%   a= uniform( NL )


[N,M]=size(NL);
gama=zeros(1,N);

for i=1:N
        nk=sum(NL(:,i));
        if nk==1
           gama(1,i)=0;
        else
        gama(1,i)=1/(nk-1);   
        end
end

end

