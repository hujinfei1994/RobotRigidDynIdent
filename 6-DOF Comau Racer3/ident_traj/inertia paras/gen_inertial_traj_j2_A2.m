%% jnt = 2
% 待测试轴为2轴(jnt)，匀速往复；随动加减速轴为3轴(ax)，不同加速度往复

%% 通用参数
clear;clc;close all;
sample_time = 0.0008;
save_save_p = [];
save_save_v = [];
save_save_a = [];
save_T0 = {};
save_T_neg2pos = {};
save_T_pos2neg = {};

%% 待测试轴
jnt = 2;
vel_acc_rate_jnt0 = 0.1;
jerk_acc_rate_jnt0 = 20;
jerk_acc_rate_jnt = 20;
pos_neg_jnt = deg2rad(-40);
pos_pos_jnt = deg2rad(10);
am_jnt = deg2rad(100);
vm_jnt = deg2rad(20);

%% 随动加减速轴
jnt_ax = 3;
acc_data = deg2rad(75:25:500);
acc_num = length(acc_data);
acc_vel_rate = [7 3.6 3 2.5 2 1.8 1.7 1.5 1.2 1.1 1.1 1 1 0.9 0.8 0.75 0.7 0.7]/3;
pos_neg_ax = deg2rad(-70);
pos_pos_ax = deg2rad(40);
% 起始终止段
am_ax0 = deg2rad(80);
jerk_acc_rate_ax0 = 10;
vel_acc_rate_ax0 = 20;


%% 待测试轴第一段：0~ pos_neg
p0 = deg2rad(0);
p1 = pos_neg_jnt;
am = am_jnt;
vm = am*vel_acc_rate_jnt0;
jm = am*jerk_acc_rate_jnt0;
Tt = 0;
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
save_T0{1}.T1 = T(1);
save_T0{1}.T2 = T(2);
save_T0{1}.T3 = T(3);
save_T0{1}.T4 = T(4);
save_T0{1}.T5 = T(5);
save_T0{1}.T6 = T(6);
save_T0{1}.T7 = T(7);



%% 待测试轴第二段：往返轨迹
for i = 1:acc_num
    %  pos_neg ~ pos_pos
    p0 = pos_neg_jnt;
    p1 = pos_pos_jnt;
    am = am_jnt;
    vm = vm_jnt;
    jm = am*jerk_acc_rate_jnt;
    Tt = 0;
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
    Tt = 0;
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


%% 待测试轴第三段： pos_neg ~ 0
p0 = pos_neg_jnt;
p1 = deg2rad(0);
am = am_jnt;
vm = am*vel_acc_rate_jnt0;
jm = am*jerk_acc_rate_jnt0;
Tt = 0;
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
save_T0{2}.T1 = T(1);
save_T0{2}.T2 = T(2);
save_T0{2}.T3 = T(3);
save_T0{2}.T4 = T(4);
save_T0{2}.T5 = T(5);
save_T0{2}.T6 = T(6);
save_T0{2}.T7 = T(7);




%% 联动轴加速轨迹设计
for i = 1:acc_num
    % neg2pos
    p0 = pos_neg_ax;
    p1 = pos_pos_ax;
    am = acc_data(i);
    jerk_acc_rate = 20;
    vm = am*acc_vel_rate(i);
    jm = am*jerk_acc_rate;
    Tt = 1;
    [T,err] = scurve_get_time(jm,am,vm,p0,p1,Tt);
    if(err~=0)
        error('err');
    end
    h = 0.0008;
    T_total = sum(T);
    save_t = 0:h:T_total;
    save_pos = zeros(size(save_t));
    save_vel = zeros(size(save_t));
    save_acc = zeros(size(save_t));
    k = 1;
    for t = save_t
        [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0,p1,jm,t);
        save_pos(k) = pos;
        save_vel(k) = vel;
        save_acc(k) = acc;
        k = k + 1;
    end
    save_a_ax_n2p{i} = save_acc';
    save_v_ax_n2p{i} = save_vel';
    save_p_ax_n2p{i} = save_pos';
    save_t_ax_n2p{i} = T;

    save_T_neg2pos_ax{i}.T1 = T(1);
    save_T_neg2pos_ax{i}.T2 = T(2);
    save_T_neg2pos_ax{i}.T3 = T(3);
    save_T_neg2pos_ax{i}.T4 = T(4);
    save_T_neg2pos_ax{i}.T5 = T(5);
    save_T_neg2pos_ax{i}.T6 = T(6); 
    save_T_neg2pos_ax{i}.T7 = T(7);

    % pos2neg
    p0 = pos_pos_ax;
    p1 = pos_neg_ax;
    am = acc_data(i);
    jerk_acc_rate = 20;
    vm = am*acc_vel_rate(i);
    jm = am*jerk_acc_rate;
    Tt = 1;
    [T,err] = scurve_get_time(jm,am,vm,p0,p1,Tt);
    if(err~=0)
        error('err');
    end
    h = 0.0008;
    T_total = sum(T);
    save_t = 0:h:T_total;
    save_pos = zeros(size(save_t));
    save_vel = zeros(size(save_t));
    save_acc = zeros(size(save_t));
    k = 1;
    for t = save_t
        [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0,p1,jm,t);
        save_pos(k) = pos;
        save_vel(k) = vel;
        save_acc(k) = acc;
        k = k + 1;
    end
    save_a_ax_p2n{i} = save_acc';
    save_v_ax_p2n{i} = save_vel';
    save_p_ax_p2n{i} = save_pos';
    save_t_ax_p2n{i} = T;

    save_T_pos2neg_ax{i}.T1 = T(1);
    save_T_pos2neg_ax{i}.T2 = T(2);
    save_T_pos2neg_ax{i}.T3 = T(3);
    save_T_pos2neg_ax{i}.T4 = T(4);
    save_T_pos2neg_ax{i}.T5 = T(5);
    save_T_pos2neg_ax{i}.T6 = T(6); 
    save_T_pos2neg_ax{i}.T7 = T(7);
end




%% 定义所有轴轨迹
save_save_p_bar = zeros(size(save_save_p));
save_save_v_bar = zeros(size(save_save_v));
save_save_a_bar = zeros(size(save_save_a));

m = length(save_save_p);
T_total = m*sample_time;
save_save_t = (0:(m-1))'*sample_time;
save_q      = zeros(m,6);
save_q_dot  = zeros(m,6);
save_q_ddot = zeros(m,6);
save_q(:,jnt) = save_save_p;
save_q_dot(:,jnt) = save_save_v;
save_q_ddot(:,jnt) = save_save_a;
save_time = save_save_t;
TT0 = save_T0{1}.T1+save_T0{1}.T2+save_T0{1}.T3+save_T0{1}.T4+save_T0{1}.T5+save_T0{1}.T6+save_T0{1}.T7;
TT  = save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3+save_T_neg2pos.T4+save_T_neg2pos.T5+save_T_neg2pos.T6+save_T_neg2pos.T7;



%% 联动轴起始段轨迹设计
p0 = 0;
p1 = pos_neg_ax;
am = am_ax0;
vm = am*vel_acc_rate_ax0;
jm = am*jerk_acc_rate_ax0;
Tt = 3;
[T,err] = scurve_get_time(jm,am,vm,p0,p1,Tt);
if(err~=0)
    error('err');
end
h = 0.0008;
T_total = sum(T);
save_t = 0:h:T_total;
save_pos = zeros(size(save_t));
save_vel = zeros(size(save_t));
save_acc = zeros(size(save_t));
k = 1;
for t = save_t
    [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0,p1,jm,t);
    save_pos(k) = pos;
    save_vel(k) = vel;
    save_acc(k) = acc;
    k = k + 1;
end
m = length(save_pos);
save_q(1:m,jnt_ax) = save_pos;
save_q(m+1:end,jnt_ax) = save_pos(end);
save_q_dot(1:m,jnt_ax) = save_vel;
save_q_ddot(1:m,jnt_ax) = save_acc;


%% 联动轴加速往复段轨迹设计
for i = 1:acc_num
    % n2p
    [~,index_n2p{i}] = min(abs(save_time - (TT0+TT*(i-1)*2+save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3)));
    m = length(save_p_ax_n2p{i});
    save_q(index_n2p{i}:index_n2p{i}+m-1,jnt_ax) = save_p_ax_n2p{i};
    save_q(index_n2p{i}+m:end,jnt_ax) = save_p_ax_n2p{i}(end);   
    save_q_dot(index_n2p{i}:index_n2p{i}+m-1,jnt_ax) = save_v_ax_n2p{i};
    save_q_ddot(index_n2p{i}:index_n2p{i}+m-1,jnt_ax) = save_a_ax_n2p{i};
    % p2n
    [~,index_p2n{i}] = min(abs(save_time - (TT0+TT*(i-1)*2+TT+save_T_neg2pos.T1+save_T_neg2pos.T2+save_T_neg2pos.T3+save_T_neg2pos.T4)));
    m = length(save_p_ax_p2n{i});
    save_q(index_p2n{i}-(m-1):index_p2n{i},jnt_ax) = save_p_ax_p2n{i};
    save_q(index_p2n{i}+1:end,jnt_ax) = save_p_ax_p2n{i}(end);
    save_q_dot(index_p2n{i}-(m-1):index_p2n{i},jnt_ax) = save_v_ax_p2n{i};
    save_q_ddot(index_p2n{i}-(m-1):index_p2n{i},jnt_ax) = save_a_ax_p2n{i};
end


%% 联动轴返回段轨迹设计
p0 = pos_neg_ax;
p1 = 0;
am = am_ax0;
vm = am*vel_acc_rate_ax0;
jm = am*jerk_acc_rate_ax0;
Tt = 3;
[T,err] = scurve_get_time(jm,am,vm,p0,p1,Tt);
if(err~=0)
    error('err');
end
h = 0.0008;
T_total = sum(T);
save_t = 0:h:T_total;
save_pos = zeros(size(save_t));
save_vel = zeros(size(save_t));
save_acc = zeros(size(save_t));
k = 1;
for t = save_t
    [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0,p1,jm,t);
    save_pos(k) = pos;
    save_vel(k) = vel;
    save_acc(k) = acc;
    k = k + 1;
end
m = length(save_pos);
save_q(end-m+1:end,jnt_ax) = save_pos;
save_q_dot(end-m+1:end,jnt_ax) = save_vel;
save_q_ddot(end-m+1:end,jnt_ax) = save_acc;




%% write to txt file
save_data = [save_q';save_q_dot';save_q_ddot';save_time'];
dlmwrite(['racer3_data_read_inertial_ident_J',num2str(jnt),'_A2.txt'],save_data);
save(['time_inertial_ident_J',num2str(jnt),'_A2.mat'],'save_T_neg2pos','save_T_pos2neg','save_T0','acc_data','acc_num','index_n2p','index_p2n','save_T_neg2pos_ax','save_T_pos2neg_ax','T_total')



%% 画图
figure(1); %q
for i = 1:6
    subplot(2,3,i)
    plot(save_time,save_q(:,i));
    legend(['qd',num2str(i)]);
    grid on
    grid minor
    title(['qd',num2str(i)]);
end
figure(2); %q_dot
for i = 1:6
    subplot(2,3,i)
    plot(save_time,save_q_dot(:,i));
    legend(['qd\_dot',num2str(i)]);
    grid on
    grid minor
    title(['qd\_dot',num2str(i)]);
end
figure(3); %q_ddot
for i = 1:6
    subplot(2,3,i)
    plot(save_time,save_q_ddot(:,i));
    legend(['qd\_ddot',num2str(i)]);
    grid on
    grid minor
    title(['qd\_ddot',num2str(i)]);
end
