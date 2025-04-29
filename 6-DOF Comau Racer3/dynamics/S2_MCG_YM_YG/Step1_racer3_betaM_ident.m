clear;clc;
load save_racer3_dyn.mat

%% Step1:单轴加减速可辨识出的betaM有beta39,beta40，分别对应56轴惯量
%剩下的18个betaM要通过1-4轴加减速求得，Y_M(1:4,:) 是 c1-c4和s1-s4的函数，和56轴已无关

%% 用4轴力矩辨识
Y_M4 = Y_M(4,:);
% 4A（辨识ZZ4、IA4）: 256轴静止在零位，3轴静止在-90度；14轴加减速
old = {q2,q3,dq2,ddq2,dq3,ddq3};
new = {sym(0),sym(-pi/2),sym(0),sym(0),sym(0),sym(0)};
Y_M4_simp = subs(Y_M4,old,new)
% 4B（辨识XX4、XY4、XZ4、YZ4）: 2356轴静止在零位；1轴加减速，4轴匀速往复以抵消摩擦力等的影响
old = {q2,q3,dq2,ddq2,dq3,ddq3};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M4_simp2 = simplify(subs(Y_M4,old,new))

%% 用3轴力矩辨识
Y_M3 = Y_M(3,:);
% 3A（辨识ZZ3和IA3）: 1456轴静止在零位，23轴加减速(合并2A平均一下ZZ3，然后计算IA3)
old = {q4,dq4,ddq4,dq1,ddq1};
new = {sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M3_simp = subs(Y_M3,old,new)
% 3B（辨识XX3、XY3、XZ3、YZ3）: 2456轴静止在零位；1轴加减速，3轴匀速往复以抵消摩擦力等的影响
old = {q2,dq2,ddq2,q4,dq4,ddq4};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M3_simp2 = simplify(subs(Y_M3,old,new))

%% 用2轴力矩辨识
Y_M2 = Y_M(2,:);
% 2A（辨识ZZ2和ZZ3）: 1456轴静止在零位，23轴加减速(合并3A平均一下ZZ3，然后计算ZZ2)
old = {q4,dq4,ddq4,dq1,ddq1};
new = {sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M2_simp = subs(Y_M2,old,new)
% 2B（辨识XX2、XY2、XZ2、YZ2）: 3456轴静止在零位；1轴加减速，2轴匀速往复以抵消摩擦力等的影响
old = {q3,dq3,ddq3,q4,dq4,ddq4};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M2_simp2 = simplify(subs(Y_M2,old,new))


%% 用1轴力矩辨识
Y_M1 = Y_M(1,:);
% 1A（辨识ZZ1）: 2456轴静止在零位，3轴静止在-90度，1轴加减速
old = {q2,q3,q4};
new = {sym(0),sym(-pi/2),sym(0)};
Y_M1_simp_tmp = subs(Y_M1,old,new);
old = {dq2,dq3,dq4,ddq2,ddq3,ddq4};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M1_simp = simplify(subs(Y_M1_simp_tmp,old,new))



