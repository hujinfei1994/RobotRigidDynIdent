%% 优化过程
clear;clc;
tic;

global jnt qx_start qx_end 
qmax=[2.0,0.9,2.2,-0.3,2.0,3.4,2.4];
qmin=[-2.0,-1.7,-2.2,-2.7,-2.0,0.2,-2.4];
travel_len = [pi,2.3,pi,2.4,pi,pi,pi];
pos_neg = qmin+((qmax-qmin)-travel_len)/2;
pos_pos = qmax-((qmax-qmin)-travel_len)/2;
jnt = 6;
qx_start = pos_neg(jnt);
qx_end   = pos_pos(jnt);



global qx_t
qx_t = 7;

global h T wf N
h  = 0.1;       %0.04s
T  = 5;        %10s
wf = 2*pi/T;   %0.1hz ~ 10s
N  = 5;         %5



global q1_max q1_dotmax q1_ddotmax
q1_max = deg2rad(140);
q1_dotmax = 2.18;
q1_ddotmax = 15;


A1 = ones(5,1)*0.1;
B1 = ones(5,1)*0.23;
C1 = 0.1;

x0(1:5)   = A1;
x0(6:10)  = B1;
x0(11)    = C1;

options = optimoptions('fmincon','Display','iter');  
options = optimoptions(options,'Display','iter','MaxIter',15000,'MaxFunEvals',1000000)
[x z exitflag output]=fmincon(@optim_object,x0,[],[],[],[],[],[],@optim_constraints,options);
save_x = x;
name_str = ['save_x_optimized_franka_jnt',num2str(jnt),'.mat']
save(name_str,'save_x')
exitflag
toc



%% 定义目标函数
function f =optim_object(x)
    global h T
    global jnt qx_start qx_end qx_t
    save_t = 0:h:T;
    m = length(save_t);
    Phi = zeros(m,4);
    for i = 1:m
        t = save_t(i);
        Y = get_Yx(x,t,jnt,qx_start,qx_end,qx_t);
        Phi(i,:) = Y;
    end
%     f=cond(Phi) + 1000*1/(norm(Phi));
    f=cond(Phi) + 500*1/(norm(Phi));
end




%% 定义约束
function [cneq,ceq]=optim_constraints(x)
    global h T wf N
    global q1_max q1_dotmax q1_ddotmax
    %!!!x must be a column vector
    %% x
    A1 = x(1:5);
    B1 = x(6:10);
    C1 = x(11);
    
    %% q1 dq1 ddq1
    t = 0;
    q1_0 = C1;
    dq1_0 = 0;
    ddq1_0 = 0;
    for l = 1:N
        q1_0 = q1_0 + A1(l)*sin(l*wf*t)/(wf*l) - B1(l)*cos(l*wf*t)/(wf*l);
        dq1_0 = dq1_0 + A1(l)*cos(l*wf*t) + B1(l)*sin(l*wf*t);
        ddq1_0 = ddq1_0 - A1(l)*l*wf*sin(l*wf*t) + B1(l)*l*wf*cos(l*wf*t);
    end
    t = T;
    q1_f = C1;
    dq1_f = 0;
    ddq1_f = 0;
    for l = 1:N
        q1_f = q1_f + A1(l)*sin(l*wf*t)/(wf*l) - B1(l)*cos(l*wf*t)/(wf*l);
        dq1_f = dq1_f + A1(l)*cos(l*wf*t) + B1(l)*sin(l*wf*t);
        ddq1_f = ddq1_f - A1(l)*l*wf*sin(l*wf*t) + B1(l)*l*wf*cos(l*wf*t);
    end   
    
    %% ceq
    ceq = [q1_0;dq1_0;ddq1_0;q1_f;dq1_f;ddq1_f];    

    %% cneq   
    % q1
    q1 = abs(C1);
    q1_dot = 0;
    q1_ddot = 0;   
    for l = 1:N   
        q1 = q1 + sqrt(A1(l)^2+B1(l)^2)/(wf*l);
        q1_dot = q1_dot + sqrt(A1(l).^2+B1(l).^2);
        q1_ddot = q1_ddot + sqrt(A1(l).^2+B1(l).^2)*(wf*l);
    end

    cneq = [q1-q1_max;q1_dot-q1_dotmax;q1_ddot-q1_ddotmax];
end
