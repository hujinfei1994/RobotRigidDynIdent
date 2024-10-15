clear;close all;clc;

filename = 'franka_data_read_grav_rip_fric_ident_J7.txt';
data= load(filename);
qd=data(1:7,:)';
qd_dot=data(8:14,:)';
qd_ddot=data(15:21,:)';
t=data(22,:)';

figure(1); %q
for i = 1:7
    subplot(2,4,i)
    plot(t,qd(:,i));
end
figure(2); %q_dot
for i = 1:7
    subplot(2,4,i)
    plot(t,qd_dot(:,i));
end
figure(3); %q_ddot
for i = 1:7
    subplot(2,4,i)
    plot(t,qd_ddot(:,i));
end