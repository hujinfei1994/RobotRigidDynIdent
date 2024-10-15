clear;clc;close all;

% %% J1 : 
jnt = 1;
acc_vel_rate =10;
jerk_acc_rate = 30;
pos_neg = deg2rad(-80);
pos_pos = deg2rad(80);
acc_data = (4:4:40)';

%% 通用参数
sample_time = 0.0004;

acc_num = length(acc_data);
save_save_p = [];
save_save_v = [];
save_save_a = [];

save_T0 = {};
save_T_neg2pos = {};
save_T_pos2neg = {};



%% 第一段：0~ pos_neg
p0 = 0;
p1 = pos_neg;
am = deg2rad(100);
vm = am/acc_vel_rate;
jm = am*jerk_acc_rate;
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



%% 4A段：往返轨迹
for i = 1:acc_num
    %%  pos_neg ~ pos_pos
    p0 = pos_neg;
    p1 = pos_pos;
    am = acc_data(i);
    vm = am/acc_vel_rate;
    jm = am*jerk_acc_rate;
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
    save_T_neg2pos{i}.T1 = T(1);
    save_T_neg2pos{i}.T2 = T(2);
    save_T_neg2pos{i}.T3 = T(3);
    save_T_neg2pos{i}.T4 = T(4);
    save_T_neg2pos{i}.T5 = T(5);
    save_T_neg2pos{i}.T6 = T(6); 
    save_T_neg2pos{i}.T7 = T(7);
    
    
    %% pos_pos ~ pos_neg
    p0 = pos_pos;
    p1 = pos_neg;
    am = acc_data(i);
    vm = am/acc_vel_rate;
    jm = am*jerk_acc_rate;
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
    save_T_pos2neg{i}.T1 = T(1);
    save_T_pos2neg{i}.T2 = T(2);
    save_T_pos2neg{i}.T3 = T(3);
    save_T_pos2neg{i}.T4 = T(4);
    save_T_pos2neg{i}.T5 = T(5);
    save_T_pos2neg{i}.T6 = T(6);
    save_T_pos2neg{i}.T7 = T(7);
end

%% 第三段： pos_neg ~ 0
p0 = pos_neg;
p1 = 0;
am = deg2rad(100);
vm = am/acc_vel_rate;
jm = am*jerk_acc_rate;
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



%% write to txt file
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
save_data = [save_q';save_q_dot';save_q_ddot';save_time'];
dlmwrite(['racer3_data_read_inertial_ident_J',num2str(jnt),'_A1.txt'],save_data);
save(['time_inertial_ident_J',num2str(jnt),'_A1.mat'],'save_T_neg2pos','save_T_pos2neg','save_T0','acc_data','acc_num','T_total')



%% 画图
figure
subplot(2,2,1)
plot(save_save_t,save_save_p)
xlabel('time(s)')
ylabel('pos(rad)')
axis tight
subplot(2,2,2)
plot(save_save_t,save_save_v)
xlabel('time(s)')
ylabel('vel(rad/s)')
axis tight
subplot(2,2,3)
plot(save_save_t,save_save_a)
xlabel('time(s)')
ylabel('acc(rad/s/s)')
axis tight

m = length(save_T_neg2pos);
T2 = zeros(m,1);
T6 = zeros(m,1);
for i = 1:acc_num
    T2(i) = save_T_neg2pos{i}.T2;
    T6(i) = save_T_neg2pos{i}.T6;
end
figure
plot(T2)
hold on
plot(T6)