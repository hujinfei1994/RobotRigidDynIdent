clear;clc;
load save_racer3_dyn.mat

%% Step1:����Ӽ��ٿɱ�ʶ����betaM��beta39,beta40���ֱ��Ӧ56�����
%ʣ�µ�18��betaMҪͨ��1-4��Ӽ�����ã�Y_M(1:4,:) �� c1-c4��s1-s4�ĺ�������56�����޹�

%% ��4�����ر�ʶ
Y_M4 = Y_M(4,:);
% 4A����ʶZZ4��IA4��: 256�ᾲֹ����λ��3�ᾲֹ��-90�ȣ�14��Ӽ���
old = {q2,q3,dq2,ddq2,dq3,ddq3};
new = {sym(0),sym(-pi/2),sym(0),sym(0),sym(0),sym(0)};
Y_M4_simp = subs(Y_M4,old,new)
% 4B����ʶXX4��XY4��XZ4��YZ4��: 2356�ᾲֹ����λ��1��Ӽ��٣�4�����������Ե���Ħ�����ȵ�Ӱ��
old = {q2,q3,dq2,ddq2,dq3,ddq3};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M4_simp2 = simplify(subs(Y_M4,old,new))

%% ��3�����ر�ʶ
Y_M3 = Y_M(3,:);
% 3A����ʶZZ3��IA3��: 1456�ᾲֹ����λ��23��Ӽ���(�ϲ�2Aƽ��һ��ZZ3��Ȼ�����IA3)
old = {q4,dq4,ddq4,dq1,ddq1};
new = {sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M3_simp = subs(Y_M3,old,new)
% 3B����ʶXX3��XY3��XZ3��YZ3��: 2456�ᾲֹ����λ��1��Ӽ��٣�3�����������Ե���Ħ�����ȵ�Ӱ��
old = {q2,dq2,ddq2,q4,dq4,ddq4};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M3_simp2 = simplify(subs(Y_M3,old,new))

%% ��2�����ر�ʶ
Y_M2 = Y_M(2,:);
% 2A����ʶZZ2��ZZ3��: 1456�ᾲֹ����λ��23��Ӽ���(�ϲ�3Aƽ��һ��ZZ3��Ȼ�����ZZ2)
old = {q4,dq4,ddq4,dq1,ddq1};
new = {sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M2_simp = subs(Y_M2,old,new)
% 2B����ʶXX2��XY2��XZ2��YZ2��: 3456�ᾲֹ����λ��1��Ӽ��٣�2�����������Ե���Ħ�����ȵ�Ӱ��
old = {q3,dq3,ddq3,q4,dq4,ddq4};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M2_simp2 = simplify(subs(Y_M2,old,new))


%% ��1�����ر�ʶ
Y_M1 = Y_M(1,:);
% 1A����ʶZZ1��: 2456�ᾲֹ����λ��3�ᾲֹ��-90�ȣ�1��Ӽ���
old = {q2,q3,q4};
new = {sym(0),sym(-pi/2),sym(0)};
Y_M1_simp_tmp = subs(Y_M1,old,new);
old = {dq2,dq3,dq4,ddq2,ddq3,ddq4};
new = {sym(0),sym(0),sym(0),sym(0),sym(0),sym(0)};
Y_M1_simp = simplify(subs(Y_M1_simp_tmp,old,new))



