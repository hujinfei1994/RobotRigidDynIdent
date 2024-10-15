clear;clc;
load('T_flexiv.mat')
tic;
global h T wf N T_pinv_70_by_37 

h = 0.1;      %采样周期 0.01s
T = 10;       %轨迹时间 10s
wf= 2*pi/10;  %基频为0.1hz ~ 10s
N = 5;        %5次傅里叶叠加


% load('x.mat');
%x0 = 0.1*ones(77,1); % cond_num = 99
x0 = rand(77,1)*0.1;

options = optimoptions('fmincon','Display','iter');
options = optimoptions(options,'Display','iter','MaxIter',15000,'MaxFunEvals',1000000)
[x z exitflag output]=fmincon(@optim_object,x0,[],[],[],[],[],[],@optim_constraints,options);

% clc;
% x
% z
% disp('迭代次数为：')
% disp(output.iterations)
exitflag
if exitflag>0    
    disp('求解过程正常收敛')
    save x.mat x x0
elseif exitflag==0    
    disp('超过迭代次数限制')
else
    disp('收敛异常')
end
toc


function f =optim_object(x)
    global h T wf N T_pinv_70_by_37
    %!!!x must be a column vector
    a = [x(1:7),x(8:14),x(15:21),x(22:28),x(29:35)];  %7 by 5
    b = [x(36:42),x(43:49),x(50:56),x(57:63),x(64:70)]; %7 by 5
    c = x(71:77); %7 by 1
    Phi = [];
    for t = 0:h:T
        q = c;
        q_dot = 0;
        q_ddot = 0;
        for l = 1:N
            q = q + a(:,l)*sin(l*wf*t)/(wf*l) - b(:,l)*cos(l*wf*t)/(wf*l);
            q_dot = q_dot + a(:,l)*cos(l*wf*t) + b(:,l)*sin(l*wf*t);
            q_ddot = q_ddot - a(:,l)*l*wf*sin(l*wf*t) + b(:,l)*l*wf*cos(l*wf*t);
        end
        Ys = Y_flexiv_symoro(q,q_dot,q_ddot);
        Y = Ys*T_pinv_70_by_37;

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


function [cneq,ceq]=optim_constraints(x)
    global  T wf N
    %!!!x must be a column vector
    a = [x(1:7),x(8:14),x(15:21),x(22:28),x(29:35)];  %7 by 5
    b = [x(36:42),x(43:49),x(50:56),x(57:63),x(64:70)]; %7 by 5
    c = x(71:77); %7 by 1
    
    %% 位置、速度、加速度上下界
    q_min = deg2rad([-140,-90,-150,-90,-150,-60,-150]')*0.5;
    q_max = deg2rad([140,90,150,130,150,230,150]')*0.5;
    q_dotmax = deg2rad([120,120,140,140,280,280,280]')*0.6;
    q_ddotmax = [10,10,10,10,10,10,10]';
    
    %% ceq
    q_init = zeros(7,1);
    for jnt = 1:7
        q_init(jnt)=(q_max(jnt)+q_min(jnt))/2;
    end
    q_dot_init = zeros(7,1);
    q_ddot_init = zeros(7,1);
    
    q0 = c;
    q_dot0 = zeros(7,1);
    q_ddot0 = zeros(7,1); 
    for l = 1:N
        q0 = q0 - b(:,l)/(wf*l);
        q_dot0 = q_dot0 + a(:,l);
        q_ddot0 = q_ddot0 + b(:,l)*wf*l;
    end

    qf = c;
    q_dotf = zeros(7,1);
    q_ddotf = zeros(7,1);
    for l = 1:N
        qf = qf + a(:,l)*sin(wf*l*T)/(wf*l) - b(:,l)*cos(wf*l*T)/(wf*l);
        q_dotf = q_dotf + a(:,l)*cos(wf*l*T) + b(:,l)*sin(wf*l*T);
        q_ddotf = q_ddotf - a(:,l)*wf*l*sin(wf*l*T) + b(:,l)*wf*l*cos(wf*l*T);
    end

    ceq = [q0-q_init;q_dot0-q_dot_init;q_ddot0-q_ddot_init;qf-q_init;q_dotf-q_dot_init;q_ddotf-q_ddot_init];

    %% cneq
    q=abs(c-(q_max+q_min)/2);
    q_dot = 0;
    q_ddot = 0;

    for l = 1:N
        q = q + sqrt(a(:,l).^2+b(:,l).^2)/(wf*l);
        q_dot = q_dot + sqrt(a(:,l).^2+b(:,l).^2);
        q_ddot = q_ddot + sqrt(a(:,l).^2+b(:,l).^2)*(wf*l);
    end
    cneq = [q-(q_max-q_min)/2;q_dot-q_dotmax;q_ddot-q_ddotmax];
    
 
end

