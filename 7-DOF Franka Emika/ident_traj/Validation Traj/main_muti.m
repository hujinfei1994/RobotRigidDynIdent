clear;clc;close all;



% qmax=[-2.0,-1.5,-1.0,-2.0,-1.8,0.5,-1.0];
% qmin=[2.0,0.9,1.0,-0.3,1.8,2.6,1.4];
vmax=[2.18,2.18,2.18,2.18,2.61,2.61,2.61];
amax=[15,7.5,10,12.5,15,20,20];

acc_vel_rate = amax./vmax;
jerk_acc_rate = [10;10;10;10;10;10;10];
max_vel = vmax;

percent_data=10:10:80;
percent_num=length(percent_data);


%% J1,J2,J3,J4,J5,J6£¬J7
pos_neg = [-2.0,-1.5,-1.0,-2.0,-1.8,0.5,-1.0];
pos_pos = [2.0,0.9,1.0,-0.3,1.8,2.6,1.4];
gen_test_traj_muti;


