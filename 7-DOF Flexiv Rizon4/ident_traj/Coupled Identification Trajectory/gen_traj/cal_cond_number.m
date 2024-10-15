clear;clc;close all
%load save_x_flexiv_cond99.mat
%load save_x_flexiv_cond106.mat
load save_x_flexiv_cond117.mat
%load save_x_flexiv_cond122.mat


load T_flexiv.mat
xx = x;
%% a b c 
a = [x(1:7),x(8:14),x(15:21),x(22:28),x(29:35)];  %7 by 5
b = [x(36:42),x(43:49),x(50:56),x(57:63),x(64:70)]; %7 by 5
c = x(71:77); %7 by1
h = 0.001;    %采样周期 0.01s
T = 10;    %轨迹时间 10s
wf = 2*pi/10; %基频为0.1hz ~ 10s
N=5;          %5次傅里叶叠加

save_t = 0:h:T; % Define the time vector
m = length(save_t); % Number of time steps
Phi = zeros(7*m, 37); % Initialize Phi matrix
Phi_M = zeros(7*m, 27);
Phi_G = zeros(7*m, 10);

save_q = [];
save_q_dot = [];
save_q_ddot = [];
cnt = 1;


for t = save_t
    q = c;
    q_dot = 0;
    q_ddot = 0;
    
    for l = 1:N
        q = q + a(:,l) * sin(l * wf * t) / (wf * l) - b(:,l) * cos(l * wf * t) / (wf * l);
        q_dot = q_dot + a(:,l) * cos(l * wf * t) + b(:,l) * sin(l * wf * t);
        q_ddot = q_ddot - a(:,l) * l * wf * sin(l * wf * t) + b(:,l) * l * wf * cos(l * wf * t);
    end
    
    save_q = [save_q, q];
    save_q_dot = [save_q_dot, q_dot];
    save_q_ddot = [save_q_ddot, q_ddot];
    
    Ys = Y_flexiv_symoro(q, q_dot, q_ddot);
    Y = Ys * T_pinv_70_by_37;
    Phi(cnt*7-6:cnt*7, :) = Y;
    Phi_M(cnt*7-6:cnt*7, :) = Y(:,1:27);
    Phi_G(cnt*7-6:cnt*7, :) = Y(:,28:37);
    cnt = cnt + 1;
end

Phi_cond = cond(Phi)
PhiM_cond = cond(Phi_M)
PhiG_cond = cond(Phi_G)

PhiF_cond = 5.3;

PhiM_cond*0.7+PhiG_cond*0.2+PhiF_cond*0.1
