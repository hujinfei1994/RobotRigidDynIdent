%% jnt = x
% 待测试轴为x轴(jnt)，匀速往复；随动加减速轴为1轴(ax)，优化出来的轨迹。

%% 通用参数
%clear;clc;close all;
sample_time = 0.001;
save_save_p = [];
save_save_v = [];
save_save_a = [];
save_T0 = {};
save_T_neg2pos = {};
save_T_pos2neg = {};


%% 随动加减速轴
jnt_ax = 1;
pos_neg_ax = deg2rad(-140);
pos_pos_ax = deg2rad(140);
pos_neg_jnt = pos_neg(jnt);
pos_pos_jnt = pos_pos(jnt);


Tt = 6.3;
%% 待测试轴B段：往返轨迹(3个周期取平均)
for i = 1:3
    %  pos_neg ~ pos_pos
    p0 = pos_neg_jnt;
    p1 = pos_pos_jnt;
    am = am_jnt;
    vm = vm_jnt;
    jm = am*jerk_acc_rate_jnt;
    [T,err] = scurve_get_time(jm,am,vm,p0,p1,Tt); 
    if(err~=0)
        error('err');
    end
    T_total = sum(T);
    save_t = (0:sample_time:T_total)';
    save_p = zeros(size(save_t));
    save_v = zeros(size(save_t));
    save_a = zeros(size(save_t));
    k = 1;
    for t = save_t'
        [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0,p1,jm,t);       
        save_p(k) = pos;
        save_v(k) = vel;
        save_a(k) = acc;
        k = k + 1;
    end
    save_save_a = [save_save_a;save_a];
    save_save_v = [save_save_v;save_v];
    save_save_p = [save_save_p;save_p];
    save_T_neg2pos.T1 = T(1);
    save_T_neg2pos.T2 = T(2);
    save_T_neg2pos.T3 = T(3);
    save_T_neg2pos.T4 = T(4);
    save_T_neg2pos.T5 = T(5);
    save_T_neg2pos.T6 = T(6); 
    save_T_neg2pos.T7 = T(7);

    % pos_pos ~ pos_neg
    p0 = pos_pos_jnt;
    p1 = pos_neg_jnt;
    am = am_jnt;
    vm = vm_jnt;
    jm = am*jerk_acc_rate_jnt;
    [T,err] = scurve_get_time(jm,am,vm,p0,p1,Tt);
    if(err~=0)
        error('err');
    end
    T_total = sum(T);
    save_t = (0:sample_time:T_total)';
    save_p = zeros(size(save_t));
    save_v = zeros(size(save_t));
    save_a = zeros(size(save_t));
    k = 1;
    for t = save_t'
        [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0,p1,jm,t);       
        save_p(k) = pos;
        save_v(k) = vel;
        save_a(k) = acc;
        k = k + 1;
    end
    save_save_a = [save_save_a;save_a];
    save_save_v = [save_save_v;save_v];
    save_save_p = [save_save_p;save_p];
    save_T_pos2neg.T1 = T(1);
    save_T_pos2neg.T2 = T(2);
    save_T_pos2neg.T3 = T(3);
    save_T_pos2neg.T4 = T(4);
    save_T_pos2neg.T5 = T(5);
    save_T_pos2neg.T6 = T(6);
    save_T_pos2neg.T7 = T(7);
end



%% 定义所有轴轨迹
save_save_p_bar = zeros(size(save_save_p));
save_save_v_bar = zeros(size(save_save_v));
save_save_a_bar = zeros(size(save_save_a));

m = length(save_save_p);
T_total = m*sample_time;
save_save_t = (0:(m-1))'*sample_time;
save_q      = zeros(m,7);
save_q_dot  = zeros(m,7);
save_q_ddot = zeros(m,7);
% 设置初始构型
if(jnt==2 || jnt == 5 || jnt == 6)
    save_q(:,4) = -pi/2;
elseif(jnt == 3)
    save_q(:,2) = pi/2; % 修改20240823
elseif(jnt == 4)
else    
    error('ERROR JNT');
end

save_q(:,jnt) = save_save_p;
save_q_dot(:,jnt) = save_save_v;
save_q_ddot(:,jnt) = save_save_a;
save_time = save_save_t;
TT  = save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3+save_T_neg2pos.T4+save_T_neg2pos.T5+save_T_neg2pos.T6+save_T_neg2pos.T7;


%% 优化出的联动轴1轴的轨迹
% x
A1 = save_x(1:5);
B1 = save_x(6:10);
C1 = save_x(11);

% q1 dq1 ddq1
N = 5;
T = 5;
wf = 2*pi/T;
h = sample_time;
save_t = 0:h:T;
m = length(save_t);
save_q1 = zeros(m,1);
save_dq1 = zeros(m,1);
save_ddq1 = zeros(m,1);

save_q1_samp_num = m;

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


%% 1轴加速往复段轨迹设计
for i = 1:3
    % n2p
    [~,index_n2p{i}] = min(abs(save_time - (TT*(i-1)*2+save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3)));
    m = length(save_q1);
    index_n2p_number{i}=m;
    save_q(index_n2p{i}:index_n2p{i}+m-1,jnt_ax) = save_q1;
    %save_q(index_n2p{i}+m:end,jnt_ax) = save_p_ax_n2p{i}(end);   
    save_q_dot(index_n2p{i}:index_n2p{i}+m-1,jnt_ax) = save_dq1;
    save_q_ddot(index_n2p{i}:index_n2p{i}+m-1,jnt_ax) = save_ddq1;
    % p2n
    [~,index_p2n{i}] = min(abs(save_time - (TT*(i-1)*2+TT+save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3+save_T_neg2pos.T4)));
    m = length(save_q1);
    index_p2n_number{i}=m;
    save_q(index_p2n{i}-(m-1):index_p2n{i},jnt_ax) = flip(save_q1);
    %save_q(index_p2n{i}+1:end,jnt_ax) = save_p_ax_p2n{i}(end);
    save_q_dot(index_p2n{i}-(m-1):index_p2n{i},jnt_ax) = flip(save_dq1);
    save_q_ddot(index_p2n{i}-(m-1):index_p2n{i},jnt_ax) = flip(save_ddq1);
end




%% write to txt file
save_data = [save_q';save_q_dot';save_q_ddot';save_time'];
dlmwrite(['flexiv_data_read_inertial_ident_J',num2str(jnt),'_B.txt'],save_data);
%save(['time_inertial_ident_J',num2str(jnt),'_B.mat'],'save_T_neg2pos','save_T_pos2neg','save_T0','index_p2n','index_n2p_number','index_p2n_number','index_n2p','acc_data','acc_num','T_total')

save(['time_inertial_ident_J',num2str(jnt),'_B.mat'],'save_T_neg2pos','save_T_pos2neg','save_q1_samp_num');

%% 画图
figure(1); %q
for i = 1:7
    subplot(2,4,i)
    plot(save_time,save_q(:,i));
    legend(['qd',num2str(i)]);
    grid on
    grid minor
    title(['qd',num2str(i)]);
end
figure(2); %q_dot
for i = 1:7
    subplot(2,4,i)
    plot(save_time,save_q_dot(:,i));
    legend(['qd\_dot',num2str(i)]);
    grid on
    grid minor
    title(['qd\_dot',num2str(i)]);
end
figure(3); %q_ddot
for i = 1:7
    subplot(2,4,i)
    plot(save_time,save_q_ddot(:,i));
    legend(['qd\_ddot',num2str(i)]);
    grid on
    grid minor
    title(['qd\_ddot',num2str(i)]);
end
