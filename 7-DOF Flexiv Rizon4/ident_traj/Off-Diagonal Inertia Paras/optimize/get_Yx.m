function Yx = get_Yx(x,t,jnt,qx_start,qx_end,qx_t)
    global T N
    wf = 2*pi/T;
    %% x
    A1 = x(1:5);
    B1 = x(6:10);
    C1 = x(11);
    
    %% q1 dq1 ddq1 q6
    q1 = C1;
    dq1 = 0;
    ddq1 = 0;
    for l = 1:N
        q1 = q1 + A1(l)*sin(l*wf*t)/(wf*l) - B1(l)*cos(l*wf*t)/(wf*l);
        dq1 = dq1 + A1(l)*cos(l*wf*t) + B1(l)*sin(l*wf*t);
        ddq1 = ddq1 - A1(l)*l*wf*sin(l*wf*t) + B1(l)*l*wf*cos(l*wf*t);
    end
    qx = qx_start+(qx_end-qx_start)/qx_t*t;
    
    %% Yx
    if(jnt == 6)
        Yx = [ 0.5*sin(2*qx)*dq1^2,cos(2*qx)*dq1^2,cos(qx)*ddq1,-sin(qx)*ddq1];
    elseif(jnt==5)
        Yx = [ 0.5*sin(2*qx)*dq1^2,cos(2*qx)*dq1^2,cos(qx)*ddq1,-sin(qx)*ddq1];        
    elseif(jnt==4)
        Yx = [ -0.5*sin(2*qx)*dq1^2,-cos(2*qx)*dq1^2,-sin(qx)*ddq1,-cos(qx)*ddq1];        
    elseif(jnt==3)
        Yx = [ 0.5*sin(2*qx)*dq1^2,cos(2*qx)*dq1^2,cos(qx)*ddq1,-sin(qx)*ddq1];               
    elseif(jnt==2)
        Yx = [ -0.5*sin(2*qx)*dq1^2,-cos(2*qx)*dq1^2,sin(qx)*ddq1,cos(qx)*ddq1];
    end
end