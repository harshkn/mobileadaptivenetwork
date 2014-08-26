N= 50;
M = 2;
data = load('50x_n.mat');

x_n = data.xy * 10;
v_n = rand(2,N);
vg = v_n;
rmax = 11; %threshold for distance to be considered as boundary
maxneighbors = 12;
mu_w = 0.5;
mu_v = 0.5;
w_init = zeros(2,N);

% w = zeros(1:N);