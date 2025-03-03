load('T_pinv.mat')
x = [   -0.0316
    0.1015
    0.0399
    0.0713
    0.0761
    0.1271
    0.1034
    0.0295
   -0.0504
   -0.0826
   -0.1099
   -0.3749
    0.0275
   -0.4591
   -0.0723
    0.0221
   -0.0757
    0.3624
   -0.1356
    0.4928
    0.1222
    0.0027
    0.1676
   -0.1491
    0.0364
   -0.1646
   -0.0393
   -0.0136
   -0.0581
    0.0345
   -0.0212
    0.0391
    0.0661
   -0.0096
   -0.0882
   -0.2098
   -0.0736
   -0.0743
    0.1652
    0.2604
   -0.0057
   -0.0299
    0.3332
    0.1151
   -0.3972
   -0.3064
    0.0619
    0.1971
   -0.5201
   -0.1035
    0.3442
    0.0214
    0.0424
    0.0052
    0.2498
    0.0357
   -0.1163
    0.0645
   -0.0512
   -0.0685
   -0.0430
    0.0344
    0.1258
    0.0585
   -0.1115
   -0.2728];
% %Phi_cond = 181.7325;
% %x = ones(66,1)*0.001
% 
% x = [
%     0.0262
%    -0.1162
%    -0.0791
%    -0.0451
%     0.0256
%    -0.2171
%     0.0022
%    -0.0305
%     0.2447
%    -0.0087
%     0.0467
%     0.2437
%    -0.3105
%     0.4785
%    -0.3365
%     0.2150
%    -0.2288
%     0.2212
%     0.3991
%    -0.5031
%     0.2325
%    -0.2392
%     0.2296
%    -0.3954
%    -0.1170
%     0.1713
%    -0.0615
%     0.0779
%    -0.0731
%     0.1477
%    -0.5298
%    -0.1035
%    -0.4404
%     0.1485
%     0.0597
%    -0.3945
%     0.0002
%     0.0021
%     0.2100
%    -0.2496
%    -0.0539
%     0.2078
%     0.4383
%     0.0347
%     0.1799
%     0.2325
%     0.0149
%     0.1104
%    -0.0298
%     0.0704
%    -0.1719
%    -0.1380
%     0.0150
%    -0.1265
%    -0.1333
%    -0.0573
%     0.0336
%     0.0410
%    -0.0113
%     0.0307
%    -0.6648
%    -0.1349
%    -0.4961
%     0.1193
%     0.0623
%    -0.4444    
% ];


a = [x(1:6),x(7:12),x(13:18),x(19:24),x(25:30)];  %6 by 5
b = [x(31:36),x(37:42),x(43:48),x(49:54),x(55:60)]; %6 by 5
c = x(61:66); %6 by 1

h = 1/100;    %采样周期 0.01s
T = 10;       %轨迹时间 10s
wf = 2*pi/10; %基频为0.1hz ~ 10s
N=5;          %5次傅里叶叠加
Phi = [];

save_t = [];
save_q = [];
save_q_dot = [];
save_q_ddot = [];


for t = 0:h:T
        q = c;
        q_dot  = zeros(6,1);
        q_ddot = zeros(6,1);
        for l = 1:N
            q = q + a(:,l)*sin(l*wf*t)/(wf*l) - b(:,l)*cos(l*wf*t)/(wf*l);
            q_dot = q_dot + a(:,l)*cos(l*wf*t) + b(:,l)*sin(l*wf*t);
            q_ddot = q_ddot - a(:,l)*l*wf*sin(l*wf*t) + b(:,l)*l*wf*cos(l*wf*t);
        end
        Y = Y_racer3_symoro(q,q_dot,q_ddot)*T_pinv;

        save_t = [save_t,t];
        save_q = [save_q,q];
        save_q_dot = [save_q_dot,q_dot];
        save_q_ddot = [save_q_ddot,q_ddot];
        Phi = [Phi;Y];
end
%f=cond(Phi);

Phi_svds = svds(Phi,52);
Phi_cond = Phi_svds(1)/Phi_svds(52)
 
figure(1)
for i = 1:6
    subplot(2,3,i)      
    plot(save_t,save_q(i,:))
    title(['q',num2str(i)])
end

figure(2)
for i = 1:6
    subplot(2,3,i)      
    plot(save_t,save_q_dot(i,:))
    title(['q_dot',num2str(i)])
end
 
figure(3)
for i = 1:6
    subplot(2,3,i)      
    plot(save_t,save_q_ddot(i,:))
    title(['q_ddot',num2str(i)])
end