% p0 = [-0.4;0.4;-0.5;0.6;0;-1];
% p1 = [0.4;0.1;0.2;0.9;0.4;1];
p0 = zeros(6,1);
p1 = [60,60,60,60,60,60]';
max_vel=[600,600,600,600,600,600]';
acc_vel_rate=[5;5;5;5;5;5];
jerk_acc_rate=[8;8;8;8;8;8];
percent=100;
[save_p,save_v,save_a,T_total]= Copy_of_get_movj_traj(p0,p1,max_vel,acc_vel_rate,jerk_acc_rate,percent);
t=(0:size(save_p,2)-1)'*100e-4;
%dlmwrite('racer3_data_read_test_movj.txt',movj_traj);
figure
subplot(3,1,1)
for i=1:6
    plot(t,save_p(i,:))
    hold on
end
legend('p1','p2','p3','p4','p5','p6')
subplot(3,1,2)
for i=1:6
    plot(t,save_v(i,:))
    hold on
end
legend('v1','v2','v3','v4','v5','v6')
subplot(3,1,3)
for i=1:6
    plot(t,save_a(i,:))
    hold on
end
legend('a1','a2','a3','a4','a5','a6')


