clear;clc;close all;
acc_percent = 0.1*[1,2,3,4,5,6,7,8,9,10]'*0.9;

%% 初始零位构型
p_init = [0,0,0,-pi/2,0,pi/2,0];

%% limits
% 机器人提供的限位
% qmax=[2.9,1.77,2.90,-0.07,2.90,3.75,2.90];
% qmin=[-2.9,-1.77,-2.90,-3.07,-2.90,-0.02,-2.90];
% 实际使用的限位
qmax=[2.0,0.9,2.2,-0.3,2.0,3.4,2.4];
qmin=[-2.0,-1.7,-2.2,-2.7,-2.0,0.2,-2.4];
vmax=[2.18,2.18,2.18,2.18,2.61,2.61,2.61];
amax=[15,7.5,10,12.5,15,20,20];

%% J1
jnt = 1;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;

%% J2
jnt = 2;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;

%% J3
jnt = 3;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J4
jnt = 4;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J5
jnt = 5;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J6
jnt = 6;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;


%% J7
jnt = 7;
acc_vel_rate_data = amax(jnt)*acc_percent/vmax(jnt);
jerk_acc_rate = 20;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
gen_inertia_ident_traj_A1;





