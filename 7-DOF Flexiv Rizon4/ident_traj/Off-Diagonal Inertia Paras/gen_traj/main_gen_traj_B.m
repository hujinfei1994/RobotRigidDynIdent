clear;clc;close all;

%% ≤‚ ‘÷· ˝æ›
qmin=deg2rad([-140,-90,-150,-90,-150,-60,-150]);
qmax=deg2rad([140,90,150,130,150,230,150]);
travel_len = deg2rad([180,150,180,150,180,180,180]);
pos_neg = qmin+((qmax-qmin)-travel_len)/2;
pos_pos = qmax-((qmax-qmin)-travel_len)/2;
vmax=deg2rad([120,120,140,140,280,280,280])*0.9;
amax=[15,10,10,15,15,15,15];

% 
am_jnt = deg2rad(100);
vm_jnt = deg2rad(35);
jerk_acc_rate_jnt = 20;

%% 6÷·
jnt = 6;
load save_x_optimized_flexiv_jnt6.mat
gen_inertia_ident_traj_B;

jnt = 5;
load save_x_optimized_flexiv_jnt5.mat
gen_inertia_ident_traj_B;

jnt = 4;
load save_x_optimized_flexiv_jnt4.mat
gen_inertia_ident_traj_B;

jnt = 3;
load save_x_optimized_flexiv_jnt3.mat
gen_inertia_ident_traj_B;

jnt = 2;
load save_x_optimized_flexiv_jnt2.mat
gen_inertia_ident_traj_B;

