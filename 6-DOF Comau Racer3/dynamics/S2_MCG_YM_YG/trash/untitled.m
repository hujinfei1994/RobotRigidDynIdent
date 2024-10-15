clear;clc;
load save_racer3_dyn_old.mat
new = {sin(q1),cos(q1),sin(q2),cos(q2),sin(q3),cos(q3),sin(q4),cos(q4),sin(q5),cos(q5),sin(q6),cos(q6),sin(q2+q3),cos(q2+q3)};
old = {s1,c1,s2,c2,s3,c3,s4,c4,s5,c5,s6,c6,s23 c23};
Y_M_old = subs(Y_M,old,new);
Y_G_old = subs(Y_G,old,new);

load save_racer3_dyn.mat 
simplify(Y_M_old-Y_M)
simplify(Y_G_old-Y_G)