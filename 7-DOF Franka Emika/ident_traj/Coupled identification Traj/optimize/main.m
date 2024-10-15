clear;clc;
load('T_pinv.mat')
tic;
global h T wf T_pinv

h = 0.01;    %采样周期 0.01s
T = 1;    %轨迹时间 10s
wf = 2*pi/10; %基频为0.1hz ~ 10s

global x1
x1=[];

x0 = ones(66,1)*0.001;
x0 = [    0.0059
    0.1482
    0.1588
   -0.0677
   -0.0217
   -0.0349
    0.0727
   -0.0669
   -0.1118
    0.1863
   -0.0003
    0.0764
   -0.0124
   -0.4306
   -0.3196
   -0.1226
   -0.0451
   -0.0451
   -0.0793
    0.5286
    0.4223
   -0.0005
    0.0838
    0.0000
    0.0130
   -0.1792
   -0.1497
    0.0044
   -0.0166
    0.0036
   -0.0797
    0.0222
    0.0837
   -0.0455
   -0.1226
   -0.0365
    0.0160
    0.0328
    0.0418
    0.2621
   -0.0147
    0.0533
    0.2965
   -0.0757
   -0.1264
   -0.2760
    0.0265
   -0.0290
   -0.5657
    0.0746
    0.0521
    0.0057
    0.1968
   -0.0125
    0.2843
   -0.0318
    0.0008
    0.0653
   -0.1430
    0.0133
   -0.0915
    0.0408
    0.1204
    0.0128
   -0.1599
   -0.0318];

options = optimoptions('fmincon','Display','iter');  
options=optimoptions(options,'Display','iter','MaxIter',4000,'MaxFunEvals',40000,'TolFun',1e-15,'TolX',1e-15);
 
[x z exitflag output]=fmincon(@optim_object,x0,[],[],[],[],[],[],@optim_constraints,options);

% clc;
% x
% z
% disp('迭代次数为：')
% disp(output.iterations)
exitflag
if exitflag>0    disp('求解过程正常收敛')
elseif exitflag==0    disp('超过迭代次数限制')
else    disp('收敛异常')
end
toc


function f =optim_object(x)
    global h T wf T_pinv
    %!!!x must be a column vector
    a = [x(1:6),x(7:12),x(13:18),x(19:24),x(25:30)];  %6 by 5
    b = [x(31:36),x(37:42),x(43:48),x(49:54),x(55:60)]; %6 by 5
    c = x(61:66); %6 by 1

    N=5;          %5次傅里叶叠加
    
    Phi = [];

    for t = 0:T/h
        q = c;
        q_dot = 0;
        q_ddot = 0;
        for l = 1:N
            q = q + a(:,l)*sin(l*wf*t)/(wf*l) - b(:,l)*cos(l*wf*t)/(wf*l);
            q_dot = q_dot + a(:,l)*cos(l*wf*t) + b(:,l)*sin(l*wf*t);
            q_ddot = q_ddot - a(:,l)*l*wf*sin(l*wf*t) + b(:,l)*l*wf*cos(l*wf*t);
        end
        Ys = Y_racer3_symoro(q,q_dot,q_ddot);
        Y = Ys*T_pinv;
        
        Phi = [Phi;Y];
    end
      f=cond(Phi);
%     PhiPhi = Phi'*Phi;
%     f=cond(PhiPhi);
%     svd(Phi)   
%     ff = 1;
%     for i = 1:size(Phi,2)
%         tmp = 0;
%         for j = 1:size(Phi,1)
%            tmp = tmp + Phi(j,i)^2;
%         end
%         ff = ff*tmp;
%     end
%  
%     f = 1/ff;
end


function [c,ceq]=optim_constraints(x)
    global h T wf T_pinv
    %!!!x must be a column vector
    a = [x(1:6),x(7:12),x(13:18),x(19:24),x(25:30)];  %6 by 5
    b = [x(31:36),x(37:42),x(43:48),x(49:54),x(55:60)]; %6 by 5
    c = x(61:66); %6 by 1

    wf = 2*pi/10; %基频为0.1hz ~ 10s
    N=5;          %5次傅里叶叠加
    
 %% ceq   
    q_init = zeros(6,1);
    q_dot_init = zeros(6,1);
    q_ddot_init = zeros(6,1);

    q0 = c;
    q_dot0 = zeros(6,1);
    q_ddot0 = zeros(6,1);
    for l = 1:N
        q0 = q0 - b(:,l)/(wf*l);
        q_dot0 = q_dot0 + a(:,l);
        q_ddot0 = q_ddot0 + b(:,l)*wf*l;
    end
    
    qf = c;
    q_dotf = zeros(6,1);
    q_ddotf = zeros(6,1);
    for l = 1:N
        qf = qf + a(:,l)*sin(wf*l*T)/(wf*l) - b(:,l)*cos(wf*l*T)/(wf*l);
        q_dotf = q_dotf + a(:,l)*cos(wf*l*T) + b(:,l)*sin(wf*l*T);
        q_ddotf = q_ddotf - a(:,l)*wf*l*sin(wf*l*T) - b(:,l)*wf*l*cos(wf*l*T);
    end    
    
    ceq = [q0-q_init;q_dot0-q_dot_init;q_ddot0-q_ddot_init;qf-q_init;q_dotf-q_dot_init;q_ddotf-q_ddot_init];    

    
 %% c   
%     q_max = deg2rad([150,70,70,150,90,180]);
%     q_dotmax = deg2rad([200,200,200,200,300,300]);
%     q_ddotmax = deg2rad([300,300,300,300,300,300]);
    
    q_max = deg2rad([150,70,50,150,110,300]);
    q_dotmax = deg2rad([200,200,200,200,300,300]);
    q_ddotmax = deg2rad([200,200,200,200,300,300]);
    
    q = c;
    q_dot = 0;
    q_ddot = 0;
    
    
    for l = 1:N   
        q = q + sqrt(a(:,l).^2+b(:,l).^2)/(wf*l);
        q_dot = q_dot + sqrt(a(:,l).^2+b(:,l).^2);
        q_ddot = q_ddot + sqrt(a(:,l).^2+b(:,l).^2)*(wf*l);
    end
    
    c = [q-q_max;q_dot-q_dotmax;q_ddot-q_ddotmax];
end
