function out  =Delta(x,NL,k,r)
% Delta : x_column []
[N,M]=size(NL);
out=0;


for l=1:N
      
    if(l~=k && NL(l,k)==1)
        if ((x(:,l)-x(:,k))==0)
           out_sum=0;
        else
             out_sum=(norm(x(:,l)-x(:,k))-r)*(x(:,l)-x(:,k))/norm(x(:,l)-x(:,k));
        end
        
    out=out+out_sum;
    
    end
  
    
end
    
    
end


