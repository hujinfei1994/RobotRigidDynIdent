clear;clc;close all
% load save_x_optimize_J6.mat
load save_x_optimized_franka.mat
x = save_x;
h = 0.001;
T  = 4;        %10s
wf = 2*pi/T;   %0.1hz ~ 10s
N  = 5;         %5


%% x
A1 = x(1:5);
B1 = x(6:10);
C1 = x(11);
    
%% q1 dq1 ddq1
save_t = 0:h:T;
m = length(save_t);
save_q1 = zeros(m,1);
save_dq1 = zeros(m,1);
save_ddq1 = zeros(m,1);

% q1 dq1 ddq1
for i = 1:m
    t = save_t(i);
    q1 = C1;
    dq1 = 0;
    ddq1 = 0;
    for l = 1:N
        q1 = q1 + A1(l)*sin(l*wf*t)/(wf*l) - B1(l)*cos(l*wf*t)/(wf*l);
        dq1 = dq1 + A1(l)*cos(l*wf*t) + B1(l)*sin(l*wf*t);
        ddq1 = ddq1 - A1(l)*l*wf*sin(l*wf*t) + B1(l)*l*wf*cos(l*wf*t);
    end
    save_q1(i) = q1;
    save_dq1(i) = dq1;
    save_ddq1(i) = ddq1;
end

%% show condition number
Phi = zeros(m,4);
for i = 1:m
    t = save_t(i);
    Y = get_Y6(x,t);
    Phi(i,:) = Y;
end
f=cond(Phi) + 1000*1/(norm(Phi));
g=cond(Phi);
h=1/(norm(Phi));
fprintf(['The condition number is: ',num2str(g),'\n'])
fprintf(['The norm is: ',num2str(1/h),'\n'])



%% 画出优化好的16轴轨迹
figure(1)  
subplot(2,2,1)
plot(save_t,(save_q1))
title(['q',num2str(1)])
subplot(2,2,2)
plot(save_t,(save_dq1))
title(['dq',num2str(1)])
subplot(2,2,3)
plot(save_t,(save_ddq1))
title(['ddq',num2str(1)])

%% 开始生成最终的所有轴轨迹
save_save_q = zeros(6,m);
save_save_q_dot=zeros(6,m);
save_save_q_ddot=zeros(6,m);
save_save_q(1,:) = save_q1';
save_save_q_dot(1,:) = save_dq1';
save_save_q_ddot(1,:) = save_ddq1';
save_t_run = T;

