clc;
close all;
REPETITION = 1;
ITERATIONS = 400; % more and more

lval = [0.2 0.5 0.8 0.5];

noval = [1 1 1 0];
fnmsd =   ['msdl2.fig   ';'msdl5.fig   ';'msdl8.fig   ';'msdl5n.fig  ' ];
fnmse =   ['msel2.fig   ';'msel5.fig   ';'msel8.fig   ';'msel5n.fig  ' ];
fnmsdev = ['msdevl2.fig ';'msdevl5.fig ';'msdevl8.fig ';'msdevl5n.fig' ];
lnncolor = ['-r';'-b';'-k';'-g'];

msd_val = zeros(REPETITION,ITERATIONS);  
mse_val = zeros(REPETITION,ITERATIONS); 
ms_dis_val = zeros(REPETITION,ITERATIONS);

draw=1;

if (draw == 1)
aviobj = avifile('atc1.avi','compression','None');

aviobj.quality = 100;

end

%%%%%%%%

for merged = 2:2
        kappa = 0.0005;
        zeta = 1;
        delta = 0.5;
        alpha = 0.3;
        no=1; % (0 - No cooperation) 
        
        lambda = lval(merged);
        beta = 0.5;
        
        no = noval(merged);
    
for rep = 1:REPETITION
    rep
atcparams();

temp_w = zeros(N,M);
temp_v =zeros(N,M);
int_w = zeros(N,M);
int_v = zeros(2,N);
w_now =zeros(N,M);
vg_now = zeros(N,M);
x_now = zeros(N,M);
v = zeros(M,N);
q = zeros(M,N);
w_true = [100,100]; % is just like that
w_n = zeros(M,N);
psi=zeros(M,N);
phi=zeros(M,N);



n_var = zeros(1,N);
tempxn = x_n;





    

merged
for iter = 1:ITERATIONS
    %nl = getnmat(x_n, M, N, rmax); % the max no. of nei is also input here
    nl = find_nei(x_n',maxneighbors,rmax);
    gama = Gama(nl);
    %amatrix = getamatrix(nl)';   ??
    amatrix = uniform( nl );
    cmatrix = eye(N , N);
  

    for k = 1:N
        w_true;
        x_n(k,:);
        
        C = kappa .* norm( w_true - x_n(k,:)).^2 * eye(M, M);
        n_var(k) = trace(C);
       %w_true = w_true';5
       xx = round(x_n(k,1));
       yy = round(x_n(k,2));
       r = 0;
       if (xx<50 && xx>r) && (yy<50 && yy>r)

                n_var(k)=n_var(k)+2000*(exp(-(xx-25).^2/100).*exp(-(yy-25).^2/100))/sqrt(2*pi);

       end
        q(:,k) =  w_true + randn(1,M) * sqrt(n_var(k));
       % w_true = w_true';
    end
    
  %  dif_w = q - w_n;
   % diff_v = v_n - vg;

    
sum_psi=zeros(M,N);
sum_w=zeros(M,N);
sum_phi=zeros(M,N);
sum_v_g=zeros(M,N);

for k=1:N
    for  l=1:N
    sum_psi(:,k)=sum_psi(:,k)+cmatrix(l,k)*(q(:,l)- w_n(:,k));
    end  
    psi(:,k)=w_n(:,k)+mu_w*sum_psi(:,k);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 combine %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    for  l=1:N
        sum_w(:,k)= sum_w(:,k)+amatrix(l,k)*psi(:,l);
    end
    w_n(:,k) = sum_w(:,k); 
    if (no ==1)
        for  l=1:N
            sum_phi(:,k)=sum_phi(:,k)+cmatrix(l,k)*(v_n(:,l)- vg(:,k));
        end  
        
        phi(:,k)=vg(:,k)+mu_v*sum_phi(:,k);
        for  l=1:N
            sum_v_g(:,k)= sum_v_g(:,k)+amatrix(l,k)*phi(:,l);
        end
        vg(:,k) = sum_v_g(:,k);    
    else
    % No cooperation
        for  l=1:N
            sum_v_g(:,k)= sum_v_g(:,k)+nl(l,k)*v_n(:,l);
        end
        vg(:,k) = 1/sum(nl(:,k))*sum_v_g(:,k);
    end
end 
 

    for k = 1:N % loop not required, test and remove
       
        v(:,k) = (lambda * h( w_n(:,k),x_n(k,:)' ,1))...
            + beta * vg(:,k) ...
            + alpha * g(x_n',nl,k,n_var') ...
            + gama(1,k) * Delta(x_n',nl,k,2);
        x_now(k,:) = x_n(k,:) + delta * v(:,k)';
    end
    v_n = v;
    x_n = x_now;

    
    msd_val(rep,iter) = (get_msd( N ,w_true, w_n' ));
    mse_val(rep,iter) = get_mse( vg,v,N );
    ms_dis_val(rep, iter) = get_msdisagree( v, N );
    

    if draw==1
        % Targets
        
        %%%%%%%% Contour

        for xx=1:200
             for yy=1:200
                  z(xx,yy)=trace(kappa*norm(w_true'-[xx;yy])^2*eye(M,M));
                  if (xx<50 && xx>r) && (yy<50 && yy>r)
                     z(xx,yy)=z(xx,yy)+2000*(exp(-(xx-25).^2/100).*exp(-(yy-25).^2/100))/sqrt(2*pi);
                  end
             end
        end
        
        contour(10*log10(z))
        hold on

        plot(w_true(:,1),w_true(:,2),'MarkerSize',8,'MarkerEdgeColor',[1 0 0],'Marker','*');

        axis([0 150 0 150])
        grid
        
        
        text(5,100,0, num2str(iter), 'Color', 'k');

        for k=1:N
        plot(x_n(k,1),x_n(k,2),'MarkerFaceColor',[1 1  1],'MarkerSize',4,'Marker','o','Color',[0 0 1]);
        end
        
       

        if(iter ==50)
            saveas(gcf,'spsh050.fig', 'fig')
        end
        if(iter == 150)
            saveas(gcf,'spsh150.fig', 'fig')
        end
            
        if(iter == 300)
            saveas(gcf,'spsh300.fig', 'fig')
        end
            
        if(iter == 400)
            saveas(gcf,'spsh400.fig', 'fig')    
        end
        GF(iter) = getframe; 
        hold off
         aviobj = addframe(aviobj,gcf);
        drawnow
    end

end
end
    if draw==1
        viobj = close(aviobj)
    end
if (REPETITION > 1)
    msd_mval = mean(msd_val);
    mse_mval = mean(mse_val);
    ms_dis_mval = mean(ms_dis_val);
else 
    msd_mval = msd_val;
    mse_mval = mse_val;
    ms_dis_mval = ms_dis_val;
end

%subplot(3,1,1), 
figure(1)
plot(10*log10(mse_mval),lnncolor(merged,:));
title('Transient network MSE for estimating the velocity of the center gravity in the far field')
saveas(gcf,strtrim(fnmse(merged,:)), 'fig')


%subplot(3,1,2),
figure(2)
plot(10*log10(msd_mval),lnncolor(merged,:));
title('Transient network MSD for estimating the target location, w(not)')
saveas(gcf,strtrim(fnmsd(merged,:)), 'fig')


%subplot(3,1,3), 
figure(3)
plot(10*log10(ms_dis_mval),lnncolor(merged,:));
title('Transient network mean-square disagreement of the velocities in the far field')
saveas(gcf,strtrim(fnmsdev(merged,:)), 'fig')


end








