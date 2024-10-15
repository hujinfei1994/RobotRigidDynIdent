clear;clc;close all;

%% ²âÊÔÖáÊı¾İ
qmax=[2.0,0.9,2.2,-0.3,2.0,3.4,2.4];
qmin=[-2.0,-1.7,-2.2,-2.7,-2.0,0.2,-2.4];
travel_len = [pi,2.3,pi,2.4,pi,pi,pi];
pos_neg = qmin+((qmax-qmin)-travel_len)/2;
pos_pos = qmax-((qmax-qmin)-travel_len)/2;
vmax=[2.18,2.18,2.18,2.18,2.61,2.61,2.61];
amax=[15,7.5,10,12.5,15,20,20];

% 
am_jnt = deg2rad(100);
vm_jnt = deg2rad(35);
jerk_acc_rate_jnt = 20;

%% 6Öá
jnt = 6;
load save_x_optimized_franka_jnt6.mat
gen_inertia_ident_traj_B;

jnt = 5;
load save_x_optimized_franka_jnt5.mat
gen_inertia_ident_traj_B;

jnt = 4;
load save_x_optimized_franka_jnt4.mat
gen_inertia_ident_traj_B;

jnt = 3;
load save_x_optimized_franka_jnt3.mat
gen_inertia_ident_traj_B;

jnt = 2;
load save_x_optimized_franka_jnt2.mat
gen_inertia_ident_traj_B;

