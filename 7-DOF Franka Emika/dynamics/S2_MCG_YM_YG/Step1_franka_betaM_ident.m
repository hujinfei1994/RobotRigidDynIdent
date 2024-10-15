clear;clc;
load save_franka_dyn.mat

%% Step1:单轴加减速可辨识出的betaM有beta39,beta40，分别对应56轴惯量
%剩下的18个betaM要通过1-4轴加减速求得，Y_M(1:4,:) 是 c1-c4和s1-s4的函数，和56轴已无关
%% 原点：4轴-90度，6轴90度


%% 6B（辨识XX6、XY6、XZ6、YZ6）: 23457轴静止在原位；1轴加减速，6轴匀速往复以抵消摩擦力等的影响
Y_M6 = Y_M(6,:);
old = {q2 q3 q4 q5 q7 dq2 dq3 dq4 dq5 dq7 ddq2 ddq3 ddq4 ddq5 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M6_simp_B = simplify(subs(Y_M6,old,new))


%% 5B（辨识XX5、XY5、XZ5、YZ5）: 23467轴静止在原位；1轴加减速，5轴匀速往复以抵消摩擦力等的影响
Y_M5 = Y_M(5,:);
old = {q2 q3 q4 q6 q7 dq2 dq3 dq4 dq6 dq7 ddq2 ddq3 ddq4 ddq6 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M5_simp_B = simplify(subs(Y_M5,old,new))

%% 4B（辨识XX4、XY4、XZ4、YZ4）: 23567轴静止在原位；1轴加减速，4轴匀速往复以抵消摩擦力等的影响
Y_M4 = Y_M(4,:);
old = {q2 q3 q5 q6 q7 dq2 dq3 dq5 dq6 dq7 ddq2 ddq3 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M4_simp_B = simplify(subs(Y_M4,old,new))

%% 3B（辨识XX3、XY3、XZ3、YZ3）: 24567轴静止在原位；1轴加减速，3轴匀速往复以抵消摩擦力等的影响 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!确定2轴是90还是-90
Y_M3 = Y_M(3,:);
old = {q2 q4 q5 q6 q7 dq2 dq4 dq5 dq6 dq7 ddq2 ddq4 ddq5 ddq6 ddq7};
new = { sym(pi/2) sym(-pi/2) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M3_simp_B = simplify(subs(Y_M3,old,new))

%% 2B（辨识XX2、XY2、XZ2、YZ2）: 34567轴静止在原位；1轴加减速，2轴匀速往复以抵消摩擦力等的影响
Y_M2 = Y_M(2,:);
old = {q3 q4 q5 q6 q7 dq3 dq4 dq5 dq6 dq7 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(-pi/2) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M2_simp_B = simplify(subs(Y_M2,old,new))





% 
% %% 用6轴力矩辨识
% Y_M6 = Y_M(6,:);
% % 6A（辨识ZZ6、IA6）: 123457轴静止在原位；6轴加减速
% old = {q1 q2 q3 q4 q5 q7 dq1 dq2 dq3 dq4 dq5 dq7 ddq1 ddq2 ddq3 ddq4 ddq5 ddq7};
% new = {sym(0) sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
% Y_M6_simp_A = subs(Y_M6,old,new)

% %% 4B（辨识XX4、XY4、XZ4、YZ4）: 23567轴静止在原位；1轴加减速，4轴匀速往复以抵消摩擦力等的影响
% jnt = 4;
% cnt = 1;
% old = {q1 q2 q3 q4 q5 q6 q7 dq1 dq2 dq3 dq4 dq5 dq6 dq7 ddq1 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
% new = {sym(0) sym(0) sym(0) sym(-pi/2) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
% cnt = 1;
% select = {};
% for i = 1:7
%     if(i~=jnt && i~=1 && i~=7)
%         
%     end
% end
% new = { sym(0) sym(0) sym(-pi/2) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
% Y_M5_simp_B = simplify(subs(Y_M(jnt,:),old,new))

















