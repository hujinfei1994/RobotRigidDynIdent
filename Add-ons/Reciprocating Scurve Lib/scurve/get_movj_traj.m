function  [save_p,save_v,save_a,T_max]= get_movj_traj(p0,p1,max_vel,acc_vel_rate,jerk_acc_rate,percent)
    %     max_vel       = deg2rad([50;50;30;50;50;50]);
    %     acc_vel_rate  = [3;3;3;3;3;3];
    %     jerk_acc_rate = [4;4;4;4;4;4];
    sample_time=4e-4;
    T_total=zeros(6,1);
    max_vel = max_vel*percent/100;
    for jnt = 1:6
        vm=max_vel(jnt);
        am=acc_vel_rate(jnt)*vm;
        jm=jerk_acc_rate(jnt)*am;
        [T,err] = scurve_get_time(jm,am,vm,p0(jnt),p1(jnt),0);
        if(err~=0)
            error('err');
        end
        T_total(jnt)=sum(T);
    end
    T_max=max(T_total);
    save_t = (0:sample_time:T_max)';
    save_p = zeros(6,length(save_t));
    save_v = zeros(6,length(save_t));
    save_a = zeros(6,length(save_t));
    for jnt = 1:6
        vm=max_vel(jnt);
        am=acc_vel_rate(jnt)*vm;
        jm=jerk_acc_rate(jnt)*am;
        [T,err] = scurve_get_time(jm,am,vm,p0(jnt),p1(jnt),T_max);
        if(err~=0)
            error('err');
        end
        k = 1;
        for t = 0:sample_time:T_max
            [pos,vel,acc] = scurve_get_pos_vel_acc(T,p0(jnt),p1(jnt),jm,t);       
            save_p(jnt,k) = pos;
            save_v(jnt,k) = vel;
            save_a(jnt,k) = acc;           
            k = k + 1;
        end
    end
end
 



