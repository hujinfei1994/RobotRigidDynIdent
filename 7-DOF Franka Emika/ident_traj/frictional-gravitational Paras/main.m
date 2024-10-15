clear;clc;close all;
vel_percent = 0.1*[1,2,3,4,5,6,7,8,9,10]'*0.9;
%vel_percent = 0.1*[0.5]'*0.9;

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
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_low_data = deg2rad([]');
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J2
jnt = 2;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_low_data = deg2rad([]');
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J3
jnt = 3;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_low_data = deg2rad([]');
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J4
jnt = 4;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_low_data = deg2rad([]');
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J5
jnt = 5;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_low_data = deg2rad([]');
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J6 : 
jnt = 6;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_low_data = deg2rad([]');
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;

%% J7 : 
jnt = 7;
acc_vel_rate = amax(jnt)/vmax(jnt);
jerk_acc_rate = 8;
pos_neg = qmin(jnt);
pos_pos = qmax(jnt);
vel_low_data = deg2rad([]');
vel_data = vmax(jnt)*vel_percent;
gen_grav_ripple_fric_ident_traj;