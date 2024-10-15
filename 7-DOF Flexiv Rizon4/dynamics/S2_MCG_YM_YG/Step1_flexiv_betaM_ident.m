clear;clc;
load save_flexiv_dyn.mat


%% 对角惯性辨识A1
% 通过单轴加减速辨识 beta25-beta31(ZZR1,ZZR2,...,I7zz)。不需要区分Ia和ZZ，因为关节力传感器直接测连杆端的力矩。

% 123456轴零位，7轴匀加速正反转
Y_M7 = Y_M(7,:);
old = {q1 q2 q3 q4 q5 q6 dq1 dq2 dq3 dq4 dq5 dq6 ddq1 ddq2 ddq3 ddq4 ddq5 ddq6};
new = { sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M7_simp_A1 = simplify(subs(Y_M7,old,new))
Y_G7 = Y_G(7,:);
old = {q1 q2 q3 q4 q5 q6 dq1 dq2 dq3 dq4 dq5 dq6 ddq1 ddq2 ddq3 ddq4 ddq5 ddq6};
new = { sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G7_simp_A1 = simplify(subs(Y_G7,old,new))


% 123457轴零位，6轴匀加速正反转
Y_M6 = Y_M(6,:);
old = {q1 q2 q3 q4 q5 q7 dq1 dq2 dq3 dq4 dq5 dq7 ddq1 ddq2 ddq3 ddq4 ddq5 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M6_simp_A1 = simplify(subs(Y_M6,old,new))
Y_G6 = Y_G(6,:);
old = {q1 q2 q3 q4 q5 q7 dq1 dq2 dq3 dq4 dq5 dq7 ddq1 ddq2 ddq3 ddq4 ddq5 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G6_simp_A1 = simplify(subs(Y_G6,old,new))

% 12347轴零位，6轴90度，5轴匀加速正反转
Y_M5 = Y_M(5,:);
old = {q1 q2 q3 q4 q6 q7 dq1 dq2 dq3 dq4 dq6 dq7 ddq1 ddq2 ddq3 ddq4 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M5_simp_A1 = simplify(subs(Y_M5,old,new))
Y_G5 = Y_G(5,:);
old = {q1 q2 q3 q4 q6 q7 dq1 dq2 dq3 dq4 dq6 dq7 ddq1 ddq2 ddq3 ddq4 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G5_simp_A1 = simplify(subs(Y_G5,old,new))

% 12357轴零位，6轴90度，4轴匀加速正反转
Y_M4 = Y_M(4,:);
old = {q1 q2 q3 q5 q6 q7 dq1 dq2 dq3 dq5 dq6 dq7 ddq1 ddq2 ddq3 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M4_simp_A1 = simplify(subs(Y_M4,old,new))
Y_G4 = Y_G(4,:);
old = {q1 q2 q3 q5 q6 q7 dq1 dq2 dq3 dq5 dq6 dq7 ddq1 ddq2 ddq3 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G4_simp_A1 = simplify(subs(Y_G4,old,new))

% 12457轴零位，6轴90度，3轴匀加速正反转
Y_M3 = Y_M(3,:);
old = {q1 q2 q4 q5 q6 q7 dq1 dq2 dq4 dq5 dq6 dq7 ddq1 ddq2 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M3_simp_A1 = simplify(subs(Y_M3,old,new))
Y_G3 = Y_G(3,:);
old = {q1 q2 q4 q5 q6 q7 dq1 dq2 dq4 dq5 dq6 dq7 ddq1 ddq2 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G3_simp_A1 = simplify(subs(Y_G3,old,new))

% 1357轴零位，4轴-90度,6轴90度，2轴匀加速正反转
Y_M2 = Y_M(2,:);
old = {q1 q3 q4 q5 q6 q7 dq1 dq3 dq4 dq5 dq6 dq7 ddq1 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M2_simp_A1 = simplify(subs(Y_M2,old,new))
Y_G2 = Y_G(2,:);
old = {q1 q3 q4 q5 q6 q7 dq1 dq3 dq4 dq5 dq6 dq7 ddq1 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G2_simp_A1 = simplify(subs(Y_G2,old,new))

% 23457轴零位，6轴90度，1轴匀加速正反转
Y_M1 = Y_M(1,:);
old = {q2 q3 q4 q5 q6 q7 dq2 dq3 dq4 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M1_simp_A1 = simplify(subs(Y_M1,old,new))
Y_G1 = Y_G(1,:);
old = {q2 q3 q4 q5 q6 q7 dq2 dq3 dq4 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G1_simp_A1 = simplify(subs(Y_G1,old,new))




%% 非对角惯性辨识B: tau = MC+G = YM*betaM+YG*betaG + G
% 6B（辨识XX6、XY6、XZ6、YZ6）: 2357轴静止在零位，4轴静止在-pi/2；1轴加减速，6轴匀速往复以抵消摩擦力等的影响
Y_M6 = Y_M(6,:);
old = {q2 q3 q4 q5 q7 dq2 dq3 dq4 dq5 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M6_simp_B = simplify(subs(Y_M6,old,new))

Y_G6 = Y_G(6,:);
old = {q2 q3 q4 q5 q7 dq2 dq3 dq4 dq5 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G6_simp_B = simplify(subs(Y_G6,old,new))

% 5B（辨识XX5、XY5、XZ5、YZ5）: 2367轴静止在零位，4轴静止在-pi/2；1轴加减速，5轴匀速往复以抵消摩擦力等的影响
Y_M5 = Y_M(5,:);
old = {q2 q3 q4 q6 q7 dq2 dq3 dq4 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M5_simp_B = simplify(subs(Y_M5,old,new))

Y_G5 = Y_G(5,:);
old = {q2 q3 q4 q6 q7 dq2 dq3 dq4 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G5_simp_B = simplify(subs(Y_G5,old,new))

% 4B（辨识XX4、XY4、XZ4、YZ4）: 23567轴静止在零位；1轴加减速，4轴匀速往复以抵消摩擦力等的影响
Y_M4 = Y_M(4,:);
old = {q2 q3 q5 q6 q7 dq2 dq3 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M4_simp_B = simplify(subs(Y_M4,old,new))

Y_G4 = Y_G(4,:);
old = {q2 q3 q5 q6 q7 dq2 dq3 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G4_simp_B = simplify(subs(Y_G4,old,new))

% 3B（辨识XX3、XY3、XZ3、YZ3）: 4567轴静止在零位，2轴静止在pi/2；1轴加减速，3轴匀速往复以抵消摩擦力等的影响
Y_M3 = Y_M(3,:);
old = {q2 q4 q5 q6 q7 dq2 dq4 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M3_simp_B = simplify(subs(Y_M3,old,new))

Y_G3 = Y_G(3,:);
old = {q2 q4 q5 q6 q7 dq2 dq4 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G3_simp_B = simplify(subs(Y_G3,old,new))

% 2B（辨识XX2、XY2、XZ2、YZ2）: 3567轴静止在零位，4轴静止在-pi/2；1轴加减速，2轴匀速往复以抵消摩擦力等的影响
Y_M2 = Y_M(2,:);
old = {q3 q4 q5 q6 q7 dq3 dq4 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_M2_simp_B = simplify(subs(Y_M2,old,new))

Y_G2 = Y_G(2,:);
old = {q3 q4 q5 q6 q7 dq3 dq4 dq5 dq6 dq7 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7};
new = { sym(0) sym(-pi/2) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0) sym(0)};
Y_G2_simp_B = simplify(subs(Y_G2,old,new))

%%
tau_M_off_diag6 = collect(Y_M6_simp_B*betaM',betaM)
tau_M_off_diag5 = collect(Y_M5_simp_B*betaM',betaM)
tau_M_off_diag4 = collect(Y_M4_simp_B*betaM',betaM)
tau_M_off_diag3 = collect(Y_M3_simp_B*betaM',betaM)
tau_M_off_diag2 = collect(Y_M2_simp_B*betaM',betaM)
% tau_G_off_diag6 = collect(Y_G6_simp_B*betaG',betaG)
% tau_G_off_diag5 = collect(Y_G5_simp_B*betaG',betaG)
% tau_G_off_diag4 = collect(Y_G4_simp_B*betaG',betaG)
% tau_G_off_diag3 = collect(Y_G3_simp_B*betaG',betaG)
% tau_G_off_diag2 = collect(Y_G2_simp_B*betaG',betaG)


%% 非对角惯性辨识B: 减去的重力项G
syms q1 q2 q3 q4 q5 q6 q7 real
syms L1 L2 L3 L4 L5 L6 LL real
syms g real
syms beta1 beta2 beta3 beta4 beta5 beta6 beta7 beta8 beta9 beta10 real
syms beta11 beta12 beta13 beta14 beta15 beta16 beta17 beta18 beta19 beta20 real
syms beta21 beta22 beta23 beta24 beta25 beta26 beta27 beta28 beta29 beta30 real
syms beta31 beta32 beta33 beta34 beta35 beta36 beta37 beta38 beta39 beta40 real
syms beta41 beta42 beta43 beta44 beta45 beta46 beta47 beta48 real


% subs
old = [q1 q3 q4 q5 q6 q7];
new = [sym(0),sym(0),sym(-pi/2),sym(0),sym(0),sym(0)];
G(2)= subs(G(2),old,new);

old = [q1 q2 q4 q5 q6 q7];
new = [sym(0),sym(pi/2),sym(0),sym(0),sym(0),sym(0)];
G(3)= subs(G(3),old,new);

old = [q1 q2 q3 q5 q6 q7];
new = [sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)];
G(4)= subs(G(4),old,new);

old = [q1 q2 q3 q4 q6 q7];
new = [sym(0),sym(0),sym(0),sym(-pi/2),sym(0),sym(0)];
G(5)= subs(G(5),old,new);

old = [q1 q2 q3 q4 q5 q7];
new = [sym(0),sym(0),sym(0),sym(-pi/2),sym(0),sym(0)];
G(6)= subs(G(6),old,new);


% G over g
G_g(1) = sym(0);
G_g(2)=simplify(collect(G(2),g)/g);
G_g(3)=simplify(collect(G(3),g)/g);
G_g(4)=simplify(collect(G(4),g)/g);
G_g(5)=simplify(collect(G(5),g)/g);
G_g(6)=simplify(collect(G(6),g)/g);
G_g(7) =  sym(0);

paras = [sin(q1),cos(q1),sin(q2),cos(q2),sin(q3),cos(q3),sin(q4),cos(q4),sin(q5),cos(q5),sin(q6),cos(q6),sin(q7),cos(q7)];
G_g = collect(G_g,paras);
G_g'














