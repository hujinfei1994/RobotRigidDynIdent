% p0 = [-0.4;0.4;-0.5;0.6;0;-1];
% p1 = [0.4;0.1;0.2;0.9;0.4;1];
p0 = zeros(6,1);
p1 = deg2rad([-60;40;-30;0;50;0]);
max_vel=deg2rad([150;130;150;200;130;320]);
acc_vel_rate=([4;4;4;5;7;5]);
jerk_acc_rate=([8;8;8;10;14;10]);
percent=50;
[save_p,save_v,save_a,T_total]= get_movj_traj(p0,p1,max_vel,acc_vel_rate,jerk_acc_rate,percent);
t=(0:size(save_p,2)-1)'*8e-4;
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


