clear;clc;close all;



% qmax=[-2.0,-1.5,-1.0,-2.0,-1.8,0.5,-1.0];
% qmin=[2.0,0.9,1.0,-0.3,1.8,2.6,1.4];
vmax=deg2rad([120,120,140,140,280,280,280])*0.95;
amax=[15,10,10,15,15,15,15];

acc_vel_rate = amax./vmax;
jerk_acc_rate = [10;10;10;10;10;10;10];
max_vel = vmax;

percent_data=10:10:90;
percent_num=length(percent_data);


%% J1,J2,J3,J4,J5,J6£¬J7
% qmin=deg2rad([-140,-90,-150,-90,-150,-60,-150]);
% qmax=deg2rad([140,90,150,130,150,230,150]);
pos_neg = deg2rad([-80,-80,-90,-90,-120,-50,-120]);
pos_pos = deg2rad([80,80,90,90,120,190,120]);

gen_test_traj_muti;


