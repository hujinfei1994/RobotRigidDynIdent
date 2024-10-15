
%% 通用参数
sample_time = 0.001;
save_save_p = [];
save_save_v = [];
save_save_a = [];


cnt = 1;

%% 第一段：0 ~ pos_neg
% p0 = zeros(7,1);
% p1 = pos_neg;
% percent=10;
% [save_p,save_v,save_a,T_total]= get_movj_traj_flexiv(p0,p1,max_vel,acc_vel_rate,jerk_acc_rate,percent);
% save_save_a = [save_save_a;save_a];
% save_save_v = [save_save_v;save_v];
% save_save_p = [save_save_p;save_p];
% save_T(cnt)=T_total;
% cnt = cnt +1;




%% 第二段：往返轨迹
for i = 1:percent_num
    %%  pos_neg ~ pos_pos
    p0 = pos_neg;
    p1 = pos_pos;
    percent = percent_data(i);
    [save_p,save_v,save_a,T_total]= get_movj_traj_franka(p0,p1,max_vel,acc_vel_rate,jerk_acc_rate,percent);
    save_save_a = [save_save_a,save_a];
    save_save_v = [save_save_v,save_v];
    save_save_p = [save_save_p,save_p];
    save_T(cnt)=T_total;
    cnt = cnt +1;
    
    %% pos_pos ~ pos_neg
    p0 = pos_pos;
    p1 = pos_neg;
    percent = percent_data(i);
    [save_p,save_v,save_a,T_total]= get_movj_traj_franka(p0,p1,max_vel,acc_vel_rate,jerk_acc_rate,percent);
    save_save_a = [save_save_a,save_a];
    save_save_v = [save_save_v,save_v];
    save_save_p = [save_save_p,save_p];
    save_T(cnt)=T_total;
    cnt = cnt +1;
end

%% 第三段： pos_neg ~ 0
% p0 = pos_neg;
% p1 = zeros(7,1);
% percent=10;
% [save_p,save_v,save_a,T_total]= get_movj_traj_franka(p0,p1,max_vel,acc_vel_rate,jerk_acc_rate,percent);
% save_save_a = [save_save_a,save_a];
% save_save_v = [save_save_v,save_v];
% save_save_p = [save_save_p,save_p];
% save_T(cnt)=T_total;
% cnt = cnt +1;


% %% 第四段： 1秒的0
% zeros_1s = zeros(6,1250);
% save_save_a = [save_save_a,zeros_1s];
% save_save_v = [save_save_v,zeros_1s];
% save_save_p = [save_save_p,zeros_1s];
% save_T(cnt)=1;
% cnt = cnt +1;


%% write to txt file
m = length(save_save_p);
T_total = m*sample_time;
save_save_t = (0:(m-1))*sample_time;
save_q = save_save_p;
save_q_dot = save_save_v;
save_q_ddot = save_save_a;
save_time = save_save_t;
save_data = [save_q;save_q_dot;save_q_ddot;save_time];
dlmwrite(['flexiv_data_read_validation','.txt'],save_data);
save(['flexiv_time_validation.mat'],'percent_data','percent_num','save_T')



%% 画图
figure
subplot(2,2,1)
for i=1:6
   plot(save_save_t,save_save_p(i,:))
   hold on
end
xlabel('time(s)')
ylabel('pos(rad)')
axis tight
subplot(2,2,2)
for i=1:6
   plot(save_save_t,save_save_v(i,:))
   hold on
end
xlabel('time(s)')
ylabel('vel(rad/s)')
axis tight
subplot(2,2,3)
for i=1:6
   plot(save_save_t,save_save_a(i,:))
   hold on
end
xlabel('time(s)')
ylabel('acc(rad/s/s)')
axis tight







