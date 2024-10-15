jm = 100;
am = 20;
vm = 10;
p0 = 0;
p1 = -0.5;
Tt = 1;

[T,err] = scurve_get_time(jm,am,vm,p0,p1,Tt);
if(err~=0)
    error('err');
end
h = 0.0008;
T_total = sum(T);
save_t = 0:h:T_total;
save_pos = zeros(size(save_t));
save_vel = zeros(size(save_t));
save_acc = zeros(size(save_t));
k = 1;
for t = save_t
    [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0,p1,jm,t);
    save_pos(k) = pos;
    save_vel(k) = vel;
    save_acc(k) = acc;
    k = k + 1;
end

figure
subplot(2,2,1)
plot(save_t,save_pos)
subplot(2,2,2)
plot(save_t,save_vel)
subplot(2,2,3)
plot(save_t,save_acc)

