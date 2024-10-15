
%% 通用参数
sample_time = 0.0004;
vel_num = length(vel_data);
save_save_p = [];
save_save_v = [];
save_save_a = [];

save_T0 = {};
save_T_neg2pos = {};
save_T_pos2neg = {};

save_T0_low = {};
save_T_low_neg2pos = {};
save_T_low_pos2neg = {};


%% 第一段：低速往返轨迹（Stribeck）
vel_low_num = length(vel_low_data);
pos_data_low = vel_low_data*4;
for i = 1:vel_low_num
    %% x ~ -3
    if i == 1
        p0 = 0;
    else
        p0 = -pos_data_low(i-1);
    end
    p1 = -pos_data_low(i);
    acc_vel_rate = 3.9;
    jerk_acc_rate = 7.8;
    vm = deg2rad(10);
    am = vm*acc_vel_rate;
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
    save_T0_low{i}.Ta = T(1)+T(2)+T(3);
    save_T0_low{i}.Tv = T(4);
    save_T0_low{i}.Td = T(5)+T(6)+T(7);



    %% -3 ~ 3
    p0 = -pos_data_low(i);
    p1 = pos_data_low(i);

    acc_vel_rate = 3.9;
    jerk_acc_rate = 7.8;
    vm = vel_low_data(i);
    am = vm*acc_vel_rate;
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
    save_T_low_neg2pos{i}.Ta = T(1)+T(2)+T(3);
    save_T_low_neg2pos{i}.Tv = T(4);
    save_T_low_neg2pos{i}.Td = T(5)+T(6)+T(7);

    %% 3 ~ -3
    p0 = pos_data_low(i);
    p1 = -pos_data_low(i);
    
    acc_vel_rate = 3.9;
    jerk_acc_rate = 7.8;
    vm = vel_low_data(i);
    am = vm*acc_vel_rate;
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
    save_T_low_pos2neg{i}.Ta = T(1)+T(2)+T(3);
    save_T_low_pos2neg{i}.Tv = T(4);
    save_T_low_pos2neg{i}.Td = T(5)+T(6)+T(7);
end


%% 第二段：pos_data_low ~ pos_neg
p0 = 0;
p1 = pos_neg;
vm = deg2rad(40);
am = vm*acc_vel_rate;
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
save_T0{1}.Ta = T(1)+T(2)+T(3);
save_T0{1}.Tv = T(4);
save_T0{1}.Td = T(5)+T(6)+T(7);






%% 第三段：往返轨迹
for i = 1:vel_num
    %%  pos_neg ~ pos_pos
    p0 = pos_neg;
    p1 = pos_pos;
    vm = vel_data(i);
    am = vm*acc_vel_rate;
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
    save_T_neg2pos{i}.Ta = T(1)+T(2)+T(3);
    save_T_neg2pos{i}.Tv = T(4);
    save_T_neg2pos{i}.Td = T(5)+T(6)+T(7);
    
    %% pos_pos ~ pos_neg
    p0 = pos_pos;
    p1 = pos_neg;
    vm = vel_data(i);
    am = vm*acc_vel_rate;
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
    save_T_pos2neg{i}.Ta = T(1)+T(2)+T(3);
    save_T_pos2neg{i}.Tv = T(4);
    save_T_pos2neg{i}.Td = T(5)+T(6)+T(7);
end

%% 第四段： pos_neg ~ 0
p0 = pos_neg;
p1 = 0;
vm = deg2rad(40);
am = vm*acc_vel_rate;
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
save_T0{2}.Ta = T(1)+T(2)+T(3);
save_T0{2}.Tv = T(4);
save_T0{2}.Td = T(5)+T(6)+T(7);


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
dlmwrite(['racer3_data_read_grav_rip_fric_ident_J',num2str(jnt),'.txt'],save_data);
save(['time_grav_rip_fric_ident_J',num2str(jnt),'.mat'],'save_T_neg2pos','save_T_pos2neg','save_T0','save_T_low_neg2pos','save_T_low_pos2neg','save_T0_low','vel_data','vel_low_data','vel_num','vel_low_num','T_total')



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







