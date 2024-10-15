clear;clc;close all;

%% J1
jnt = 1;
acc_vel_rate = 9;
jerk_acc_rate = 8;
pos_neg = deg2rad(-140);
pos_pos = deg2rad(140);
vel_low_data = deg2rad([]');
vel_data = deg2rad([24 24*2 24*3 24*4 24*5 24*6 24*7 24*8 24*9 240]');
gen_grav_ripple_fric_ident_traj;

%% J2
jnt = 2;
acc_vel_rate = 9;
jerk_acc_rate = 8;
pos_neg = deg2rad(-70);
pos_pos = deg2rad(70);
vel_low_data = deg2rad([]');
vel_data = deg2rad([24 24*2 24*3 24*4 24*5 24*6 24*7 24*8 24*9 240]');
gen_grav_ripple_fric_ident_traj;

%% J3
jnt = 3;
acc_vel_rate = 9;
jerk_acc_rate = 8;
pos_neg = deg2rad(-128);
pos_pos = deg2rad(64);
vel_low_data = deg2rad([]');
vel_data = deg2rad([24 24*2 24*3 24*4 24*5 24*6 24*7 24*8 24*9 240]');
gen_grav_ripple_fric_ident_traj;

%% J4
jnt = 4;
acc_vel_rate = 5;
jerk_acc_rate = 10;
pos_neg = deg2rad(-176);
pos_pos = deg2rad(176);
vel_low_data = deg2rad([]');
vel_data = deg2rad([32 32*2 32*3 32*4 32*5 32*6 32*7 32*8 32*9 320]');
gen_grav_ripple_fric_ident_traj;

%% J5
jnt = 5;
acc_vel_rate = 7;
jerk_acc_rate = 10;
pos_neg = deg2rad(-100);
pos_pos = deg2rad(100);
vel_low_data = deg2rad([]');
vel_data = deg2rad([32 32*2 32*3 32*4 32*5 32*6 32*7 32*8 32*9 320]');
gen_grav_ripple_fric_ident_traj;

%% J6 : 
jnt = 6;
acc_vel_rate = 5;
jerk_acc_rate = 10;
pos_neg = deg2rad(-180);
pos_pos = deg2rad(180);
vel_low_data = deg2rad([]');
vel_data = deg2rad([32 32*2 32*3 32*4 32*5 32*6 32*7 32*8 32*9 320]');
gen_grav_ripple_fric_ident_traj;

