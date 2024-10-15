load flexiv_getY.mat
load T_flexiv.mat
g=-9.81;%q2=1;q3=1;q4=1;q5=1;q6=1;q7=1;dq1=1;dq2=1;dq3=1;dq4=1;dq5=1;dq6=1;dq7=1;ddq1=1;ddq2=1;ddq3=1;ddq4=1;ddq5=1;ddq6=1;ddq7=1;

q = zeros(7,1);
dq = zeros(7,1);
ddq = zeros(7,1);


q1 = q(1);
dq1 = dq(1);
ddq1 = ddq(1);
q2 = q(2);
dq2 = dq(2);
ddq2 = ddq(2);
q3 = q(3);
dq3 = dq(3);
ddq3 = ddq(3);
q4 = q(4);
dq4 = dq(4);
ddq4 = ddq(4);
q5 = q(5);
dq5 = dq(5);
ddq5 = ddq(5);
q6 = q(6);
dq6 = dq(6);
ddq6 = ddq(6);
q7 = q(7);
dq7 = dq(7);
ddq7 = ddq(7);

L1=0.365;
L2=0.395;
L3=0.385;
L4=0.11;
L5=0.02;

%% 慢速算Y
tic
Y = flexiv_getY(L2,L3,L5,ddq1,ddq2,ddq3,ddq4,ddq5,ddq6,ddq7,dq1,dq2,dq3,dq4,dq5,dq6,dq7,g,q2,q3,q4,q5,q6);
toc

%% 快速算Y
tic
Ys = Y_flexiv_symoro(q,dq,ddq);
Y2 = Ys*T_pinv_70_by_37;
toc

%% 对比快慢速结果
norm(Y2-Y)


%% 
betas = rand(70,1);
betas(61) = 0;   %xx7  % XXR7=I7xx - I7yy;
betas(64) = 0;   %yy7
betas(62) = 0;   %xy7
betas(63) = 0;   %xz7
betas(65) = 0;   %yz7
betas(67) = 0;   %mx7
betas(68) = 0;   %my7
beta = T_37_by_70*betas;
norm(Ys*betas-Y*beta)

%%
[M,cg,tau,Ys_2]=flexiv_get_M_cg_tau_Ys(q,dq,ddq,betas);
norm(Ys-Ys_2)
norm(tau-(M*ddq+cg))
norm(tau-Ys_2*betas)

%%











