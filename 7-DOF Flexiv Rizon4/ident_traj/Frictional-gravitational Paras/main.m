clear;clc;close all;
vel_percent = 0.1*[1,2,3,4,5,6,7,8,9,10]'*0.9;
% vel_percent = 0.1*[1,2,3,4,9,10]'*0.9;

%% 初始零位构型
p_init = [0,0,0,0,0,0,0];

%% limits
% 机器人提供的限位
% qmin=deg2rad([-160,-130,-170,-107,-170,-80,-170]);
% qmax=deg2rad([160,130,170,154,170,260,170]);
% 实际使用的限位
qmin=deg2rad([-140,-90,-150,-90,-150,-60,-150]);
qmax=deg2rad([140,90,150,130,150,230,150]);
vmax=deg2rad([120,120,140,140,280,280,280]);
amax=[15,10,10,15,15,15,15];


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