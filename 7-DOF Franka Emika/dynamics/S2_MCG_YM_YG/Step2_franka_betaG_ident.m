%% 备注：辨识单轴参数，其他轴回到初始构型 [0,0,0,-pi/2,0,pi/2,0]
%% 有一个特例：辨识三轴重力参数时，2轴的初始位置为q2=-pi/2

clear;clc;
load save_franka_dyn.mat
syms q1 q2 q3 q4 q5 q6 q7 real
syms L1 L2 L3 L4 L5 L6 LL real
syms g real
syms beta1 beta2 beta3 beta4 beta5 beta6 beta7 beta8 beta9 beta10 real
syms beta11 beta12 beta13 beta14 beta15 beta16 beta17 beta18 beta19 beta20 real
syms beta21 beta22 beta23 beta24 beta25 beta26 beta27 beta28 beta29 beta30 real
syms beta31 beta32 beta33 beta34 beta35 beta36 beta37 beta38 beta39 beta40 real
syms beta41 beta42 beta43 beta44 beta45 beta46 beta47 beta48 real

%% subs
old = [q1 q3 q4 q5 q6 q7];
new = [sym(0),sym(0),sym(-pi/2),sym(0),sym(pi/2),sym(0)];
G(2)= subs(G(2),old,new);

% 注意：此时初始位置q2=-pi/2
old = [q1 q2 q4 q5 q6 q7];
new = [sym(0),sym(-pi/2),sym(-pi/2),sym(0),sym(pi/2),sym(0)];
G(3)= subs(G(3),old,new);

old = [q1 q2 q3 q5 q6 q7];
new = [sym(0),sym(0),sym(0),sym(0),sym(pi/2),sym(0)];
G(4)= subs(G(4),old,new);

old = [q1 q2 q3 q4 q6 q7];
new = [sym(0),sym(0),sym(0),sym(-pi/2),sym(pi/2),sym(0)];
G(5)= subs(G(5),old,new);

old = [q1 q2 q3 q4 q5 q7];
new = [sym(0),sym(0),sym(0),sym(-pi/2),sym(0),sym(0)];
G(6)= subs(G(6),old,new);



% G over g
G_g(1)=simplify(G(1)/g);
G_g(2)=simplify(collect(G(2),g)/g);
G_g(3)=simplify(collect(G(3),g)/g);
G_g(4)=simplify(collect(G(4),g)/g);
G_g(5)=simplify(collect(G(5),g)/g);
G_g(6)=simplify(collect(G(6),g)/g);
G_g(7)=simplify(G(7)/g);

G_g = collect(G_g,betaG);
G_g'


