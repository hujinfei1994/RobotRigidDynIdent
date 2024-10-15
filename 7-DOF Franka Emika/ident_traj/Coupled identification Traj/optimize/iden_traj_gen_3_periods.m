clear;clc;
load('T_p.mat');

x = [0.142497665407762;0.0863318274013026;0.138482846515764;-0.0794287622930922;-0.104173115885999;0.111912435729706;0.167184482618822;-0.199154522813527;-0.187028532740537;-0.219337958530823;0.0586432439663154;0.164304142708605;-0.127628173141375;-0.185743156397087;0.0170146359870672;0.0248247497410407;-0.0176064520186409;0.0662900314173315;-0.152062854424661;0.213381273867381;0.00882093196136141;0.0858712258269313;0.115846460410344;0.163804773309625;-0.0858288610582368;-0.00399305789433890;-0.134076000952463;0.104115063152663;-0.0463627028752608;-0.0403148821203501;-0.0653087472251809;0.0404520491406844;0.0123605202705737;0.0197299286730223;-0.118768448749135;0.0438521599268105;0.00199495020455419;0.0895718675401182;0.0119695010473851;0.0451003827640605;-0.0525843342003119;0.0388447166511402;0.0927363948776392;-0.115854370520480;-0.0719042898217277;-0.153937454035417;0.123556824361712;0.0557343559635552;-0.0679648347123826;-0.117088002825359;0.0653559094236643;-0.0191285284014095;0.118498435220740;-0.163430988834831;0.0879879502157222;-0.0497853011682027;-0.0462231039258255;0.160839443403243;0.0874789428964958;0.108498465915686;-0.0437769203993954;-0.249471493765010;0.125814518009108;0.0612017069902088;-0.122010392745851;-0.0476424089345723;-0.0985867064030974;0.0687648559896983;0.140669800906348;-0.141787092809230;0.0825715833931875;-0.0291119553651233;0.0948338291815862;-1.52880717511780;0.0909062089172463;1.94963262194400;0.0258756468508709];
%Phi_cond = 181.7325;

a = [x(1:7),x(8:14),x(15:21),x(22:28),x(29:35)];  %7 by 5
b = [x(36:42),x(43:49),x(50:56),x(57:63),x(64:70)]; %7 by 5
c = x(71:77); %7 by 1

% h = 1/1250;    %采样周期 0.01s
h = 0.01;
T = 10;    %轨迹时间 10s
wf = 2*pi/10; %基频为0.1hz ~ 10s
N=5;          %5次傅里叶叠加
Phi = [];

save_t = [];
save_q = [];
save_q_dot = [];
save_q_ddot = [];

for t = 0:h:T
    q = c;
    q_dot = 0;
    q_ddot = 0;
    for l = 1:N
        q = q + a(:,l)*sin(l*wf*t)/(wf*l) - b(:,l)*cos(l*wf*t)/(wf*l);
        q_dot = q_dot + a(:,l)*cos(l*wf*t) + b(:,l)*sin(l*wf*t);
        q_ddot = q_ddot - a(:,l)*l*wf*sin(l*wf*t) + b(:,l)*l*wf*cos(l*wf*t);
    end
    save_t = [save_t,t];
    save_q = [save_q,q];
    save_q_dot = [save_q_dot,q_dot];
    save_q_ddot = [save_q_ddot,q_ddot];
    
    Ys = Y_franka_symoro(q,q_dot,q_ddot);
    %Y = Ys*T_pinv;
    %Phi = [Phi;Y];
end

%Phi_cond = cond(Phi)

rate = 1.0;
save_q = save_q*rate;
save_q_dot = save_q_dot*rate;
save_q_ddot = save_q_ddot*rate;

period = 3;
save_q = [save_q,save_q,save_q];
save_q_dot = [save_q_dot,save_q_dot,save_q_dot];
save_q_ddot = [save_q_ddot,save_q_ddot,save_q_ddot];
save_t = [save_t,save_t+10,save_t+20];

globalJointCmdPos    = save_q;
globalJointCmdVel    = save_q_dot;
globalJointCmdAcc    = save_q_ddot;
globalEECmdForce     = zeros(size(globalJointCmdPos));
globalJointCmdTorque = zeros(size(globalJointCmdPos));
globalJointActPos    = zeros(size(globalJointCmdPos));
globalJointActVel    = zeros(size(globalJointCmdPos));
globalJointActTorque = zeros(size(globalJointCmdPos));
globalEEActForce     = zeros(size(globalJointCmdPos));
time                 = save_t;

%save_data = [save_t;save_q;save_q_dot;save_q_ddot];
%save_data = [globalJointCmdPos;globalJointCmdVel;globalJointCmdAcc;globalEECmdForce;globalJointCmdTorque;globalJointActPos;globalJointActVel;globalJointActTorque;time];
save_data = [globalJointCmdPos;globalJointCmdVel;globalJointCmdAcc;time];
save('data.mat','save_data');
dlmwrite('franka_data_read.txt',save_data);

% racer3_data_read.txt
% globalJointCmdPos    6
% globalJointCmdVel    6
% globalJointCmdAcc    6
% time                 1
% TOTAL:6*3+1=19 rows

q_max = max(save_q,[],2);
q_min = min(save_q,[],2);
q_dot_max = max(save_q_dot,[],2);
q_dot_min = min(save_q_dot,[],2);
q_ddot_max = max(save_q_ddot,[],2);
q_ddot_min = min(save_q_ddot,[],2);

figure(1)
for i = 1:7
    subplot(3,3,i)      
    plot(save_t,save_q(i,:))
    title(['q',num2str(i)])
end

figure(2)
for i = 1:7
    subplot(3,3,i)      
    plot(save_t,save_q_dot(i,:))
    title(['q_{dot}',num2str(i)])
end
 
figure(3)
for i = 1:7
    subplot(3,3,i)      
    plot(save_t,save_q_ddot(i,:))
    title(['q_{ddot}',num2str(i)])
end

