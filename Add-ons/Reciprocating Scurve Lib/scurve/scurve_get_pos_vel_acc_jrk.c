#include "mex.h" 
#include <math.h>


typedef  double HKA_F64;
typedef  int    HKA_S32;
typedef  int    HKA_STATUS;
#define HKA_STS_ERR (-1)
#define HKA_STS_OK 0
#define HKA_STS_ERR_STEP (-3)
#define TRAJ_SCURVE_PO_MIN (-200)
#define TRAJ_SCURVE_PO_MAX (200)
#define TRAJ_SCURVE_P1_MIN (-200)
#define TRAJ_SCURVE_P1_MAX (200)
#define TRAJ_SCURVE_T_MIN (0.01)
#define TRAJ_SCURVE_T_MAX (20) 
#define TRAJ_SCURVE_DT_MIN (0.0005)
#define TRAJ_SCURVE_DT_MAX (0.02) 
#define TRAJ_SCURVE_ERROR_POS (39) 
#define TRAJ_SCURVE_ERROR_T (40)
#define TRAJ_SCURVE_ERROR_DT (41)
#define TRAJ_SCURVE_ERROR_AMDM (42)
#define TRAJ_SCURVE_ONE_THIRD (0.333333333)
#define TRAJ_SCURVE_LOOP_COUNT (1000)

typedef struct  _TRAJ_INPUT_
{
    HKA_F64 p0;
    HKA_F64 p1;
    HKA_F64 vm;
    HKA_F64 am;
    HKA_F64 dm;
    HKA_F64 jm;
    HKA_F64 dt;
    HKA_F64 Tt;
}TRAJ_INPUT;

typedef struct  _TRAJ_TRAJ_
{
    HKA_F64 pos;
    HKA_F64 vel;
    HKA_F64 acc;
    HKA_F64 jrk;
}TRAJ_TRAJ;





HKA_STATUS sol_equ_acc_triang_trapz(const HKA_F64 jm, const HKA_F64 am, const HKA_F64 dm, const HKA_F64 s, const HKA_F64 dt, HKA_F64 *sol_T1)
{
    HKA_F64 T1, T5, T6;
    HKA_F64 x0, x1, count, fx0, fx_mid;
    HKA_F64 sol_accuracy;
    x0 = 0;
    x1 = am / jm;
    T5 = dm / jm;
    count = 0;//迭代次数
    sol_accuracy = 3 * (x1 - x0);
    while (sol_accuracy>dt)
    {
        // fx0
        T1 = x0;
        T6 = jm / dm*T1*T1 - T5;
        fx0 = jm*T1*T1*T1 + 0.5*jm*T5*(2 * T5*T5 + 3 * T5*T6 + T6*T6) - s;
        // fx_mid
        T1 = (x0 + x1)*0.5;
        T6 = jm / dm*T1*T1 - T5;
        fx_mid = jm*T1*T1*T1 + 0.5*jm*T5*(2 * T5*T5 + 3 * T5*T6 + T6*T6) - s;
        // 二分法修改x0和x1
        if (fx0*fx_mid<0)
        {
            x1 = (x0 + x1)*0.5;
        }
        else
        {
            x0 = (x0 + x1)*0.5;
        }
        //防止死循环
        count = count + 1;
        if (count>TRAJ_SCURVE_LOOP_COUNT)
        {
            //error('加速度 三角形+梯形，求解超时')
            return HKA_STS_ERR_STEP;
        }
        sol_accuracy = 3 * (x1 - x0);
    }
    *sol_T1 = x0;
    return HKA_STS_OK;
}
HKA_STATUS sol_equ_slow_down(const HKA_F64 T1_init, const HKA_F64 jm, const HKA_F64 s, const HKA_F64 dt, const HKA_F64 Ta, const HKA_F64 Td, const HKA_F64 Tt, HKA_F64 *sol_T1)
{
    HKA_F64 T1, T2, T5, T6;
    HKA_F64 x0, x1, count, fx0, fx_mid;
    x0 = 0;
    x1 = T1_init;
    count = 0;
    while (3 * (x1 - x0)>dt)
    {
        //fx0
        T1 = x0;
        T2 = Ta - 2 * T1;
        T5 = (Td - sqrt(Td*Td - 4 * (T1*Ta - T1*T1)))*0.5;
        T6 = Td - 2 * T5;
        fx0 = 0.5*jm*T1*(2 * T1*T1 + 3 * T1*T2 + T2*T2) + 0.5*jm*T5*(2 * T5*T5 + 3 * T5*T6 + T6*T6) + jm*T1*(T1 + T2)*(Tt - Ta - Td) - s;
        // fx_mid
        T1 = (x0 + x1)*0.5;
        T2 = Ta - 2 * T1;
        T5 = (Td - sqrt(Td*Td - 4 * (T1*Ta - T1*T1)))*0.5;
        T6 = Td - 2 * T5;
        fx_mid = 0.5*jm*T1*(2 * T1*T1 + 3 * T1*T2 + T2*T2) + 0.5*jm*T5*(2 * T5*T5 + 3 * T5*T6 + T6*T6) + jm*T1*(T1 + T2)*(Tt - Ta - Td) - s;
        // 二分法修改x0和x1
        if (fx0*fx_mid<0)
        {
            x1 = (x0 + x1)*0.5;
        }
        else
        {
            x0 = (x0 + x1)*0.5;
        }
        count = count + 1;
        if (count>TRAJ_SCURVE_LOOP_COUNT)
        {
            //error('缩放时间，求解超时')
            return HKA_STS_ERR_STEP;
        }
        *sol_T1 = x0;
    }
    return HKA_STS_OK;
}

HKA_STATUS TRAJ_SCURVE_get_intervals(TRAJ_INPUT *input, HKA_F64 T[7])
{
    HKA_F64 p0, p1, vm, am, dm, jm, Tt, dt;
    vm = input->vm;
    am = input->am;
    dm = input->dm;
    jm = input->jm;
    p0 = input->p0;
    p1 = input->p1;
    Tt = input->Tt;
    dt = input->dt;
    if (am<dm)
    {
        return TRAJ_SCURVE_ERROR_AMDM;
    }
    // 计算各段时间算法
    HKA_F64 s, Ta, Tv, Td;
    HKA_F64 T1, T2, T3, T4, T5, T6, T7, T_total;
    HKA_F64 sa, sd, sx_dec, sx_acc;
    HKA_F64 T1_, T5_, T6_;
    HKA_F64 AA, BB, CC, Delta;
    HKA_F64 T1_init;
    HKA_STATUS sts_modu = HKA_STS_OK;
    s = fabs(p1 - p0);
    // 判断有匀速段，判断加速是否达到最大加速度，减速是否达到最小减速度
    if (vm*jm > am*am) // 加速段能达到am
    {
        T1 = am / jm;
        Ta = T1 + vm / am;
        T2 = Ta - 2 * T1;
        T3 = T1;
        sa = 0.5*jm*T1*(2 * T1*T1 + 3 * T1*T2 + T2*T2);
    }
    else               // 加速段不能达到am
    {
        T1 = sqrt(vm / jm);
        Ta = 2 * T1;
        T2 = 0;
        T3 = T1;
        sa = jm*T1*T1*T1;
    }
    if (vm*jm>dm*dm) // 减速段能达到dm
    {
        T5 = dm / jm;
        Td = T5 + vm / dm;
        T6 = Td - 2 * T5;
        T7 = T5;
        sd = 0.5*jm*T5*(2 * T5*T5 + 3 * T5*T6 + T6*T6);
    }
    else             // 减速段不能达到dm
    {
        T5 = sqrt(vm / jm);
        Td = 2 * T5;
        T6 = 0;
        T7 = T5;
        sd = jm*T5*T5*T5;
    }
    // 判断假设是否成立，即是否有匀速段
    Tv = (s - sa - sd) / vm;
    if (Tv >= 0)    // 假设成立，有匀速段，直接输出T1-T7
    {
        T4 = Tv;
    }
    else           // 假设不成立，无匀速段，Tv=0，需要重新计算T
    {
        T4 = 0;
        // 开始判断是否有匀加速、匀减速段，通过位移分别找到加速度和减速度的两个临界条件
        T5_ = dm / jm;
        // 减速度过大，连最大减速度都无法达到/刚好到达最大减速度（加速度两段三角波形）
        sx_dec = 2 * jm*T5_*T5_*T5_;
        // 到达最大减速度，但无法达到最大加速度/刚好到达最大加速度（加速度三角波形+梯形波形）
        T1_ = am / jm;
        T6_ = T1_*T1_ / T5_ - T5_;
        sx_acc = jm*T1_*T1_*T1_ + 0.5*jm*T5_*(2 * T5_*T5_ + 3 * T5_*T6_ + T6_*T6_);
        // 开始做判断
        if (s<sx_dec)//加速度两段三角波形
        {
            T1 = pow(s / (2 * jm), TRAJ_SCURVE_ONE_THIRD);
            T2 = 0;
            T3 = T1;
            T4 = 0;
            T5 = T1;
            T6 = 0;
            T7 = T1;
        }
        else if (s<sx_acc)//加速度三角波+梯形波
        {
            sts_modu = sol_equ_acc_triang_trapz(jm, am, dm, s, dt, &T1);
            T2 = 0;
            T3 = T1;
            T4 = 0;
            T5 = dm / jm;
            T6 = jm / dm*T1*T1 - T5;
            T7 = T5;
        }
        else //加速度两段梯形波形，2次方程，用Matlab Symbolic求解
        {
            T1 = am / jm;
            AA = T1 + (T5*am*am) / (dm*dm);
            BB = (3 * T1*T1*dm*dm + 2 * T1*T5*am*am + T5*T5*am*dm) / (dm*dm);
            CC = 2 * T1*T1*T1 - 2 * s / jm + (T1*T5*am*(T1*am + T5*dm)) / (dm*dm);
            Delta = BB*BB - 4 * AA*CC;
            T2 = (-BB + sqrt(Delta)) / (2 * AA);
            T3 = T1;
            T5 = dm / jm;
            T6 = (T1 + T2)*am / dm - T5;
            T7 = T5;
        }
    }
    // 根据总运行时间来调整轨迹，若T_Total<Tt,则需要拉长运行时间
    T_total = T1 + T2 + T3 + T4 + T5 + T6 + T7;
    if (T_total<Tt)
    {
        T1_init = T1;
        Ta = T1 + T2 + T3;
        Td = T5 + T6 + T7;
        // 求拉伸后的各段时间
        sts_modu = sol_equ_slow_down(T1_init, jm, s, dt, Ta, Td, Tt, &T1);
        T2 = Ta - 2 * T1;
        T3 = T1;
        T4 = Tt - Ta - Td;
        T5 = (Td - sqrt(Td*Td - 4 * (T1*Ta - T1*T1)))*0.5;
        T6 = Td - 2 * T5;
        T7 = T5;
    }
    // 输出最后的T1,T2,...,T7
    T[0] = T1;
    T[1] = T2;
    T[2] = T3;
    T[3] = T4;
    T[4] = T5;
    T[5] = T6;
    T[6] = T7;
    return sts_modu;
}

HKA_STATUS TRAJ_SCURVE_get_time_pos_vel_acc_jrk(const TRAJ_INPUT *input, const HKA_F64 T[7], const HKA_F64 t, TRAJ_TRAJ *traj)
{
    HKA_F64 T1, T2, T3, T4, T5, T6, T7;
    HKA_F64 t1, t2, t3, t4, t5, t6, t7;
    HKA_F64 v1, v2, v3, v4, v5, v6, v7;
    HKA_F64 s1, s2, s3, s4, s5, s6, s7;
    HKA_F64 tau, s, v, a, j;
    HKA_F64 T_bar;
    HKA_F64 p0, p1, vm, am, dm, jm, Tt;
    vm = input->vm;
    am = input->am;
    dm = input->dm;
    jm = input->jm;
    p0 = input->p0;
    p1 = input->p1;
    Tt = input->Tt;
    T1 = T[0];
    T2 = T[1];
    T3 = T[2];
    T4 = T[3];
    T5 = T[4];
    T6 = T[5];
    T7 = T[6];
    t1 = T1;
    t2 = t1 + T2;
    t3 = t2 + T3;
    t4 = t3 + T4;
    t5 = t4 + T5;
    t6 = t5 + T6;
    t7 = t6 + T7;
    am = jm*T1;
    dm = jm*T5;
    v1 = 0.5*jm*T1*T1;
    v2 = v1 + am*T2;
    v3 = v2 + 0.5*jm*T1*T1;
    v4 = v3;
    v5 = v4 - 0.5*jm*T5*T5;
    v6 = v5 - dm*T6;
    v7 = v6 - 0.5*jm*T5*T5;
    s1 = jm*T1*T1*T1 / 6;
    s2 = s1 + v1*T2 + 0.5*jm*T1*T2*T2;
    s3 = s2 + v2*T1 + jm*T1*T1*T1 / 3;
    s4 = s3 + v3*T4;
    s5 = s4 + v4*T5 - jm*T5*T5*T5 / 6;
    s6 = s5 + v5*T6 - 0.5*jm*T5*T6*T6;
    s7 = s6 + v6*T5 - jm*T5*T5*T5 / 3;
    T_bar = T1 + T2 + T3 + T4 + T5 + T6 + T7;

    if (t <= t1)
    {
        tau = t;
        j = jm;
        a = jm*t;
        v = jm*tau*tau / 2;
        s = jm*tau*tau*tau / 6;
    }
    else if (t<t2)
    {
        tau = t - t1;
        j = 0;
        a = am;
        v = v1 + am*tau;
        s = s1 + v1*tau + 0.5*jm*T1*tau*tau;
    }
    else if (t <= t3)
    {
        tau = t - t2;
        j = -jm;
        a = am - jm*tau;
        v = v2 + am*tau - jm*tau*tau / 2;
        s = s2 + v2*tau + jm*T1*tau*tau / 2 - jm*tau*tau*tau / 6;
    }
    else if (t<t4)
    {
        tau = t - t3;
        j = 0;
        a = 0;
        v = v3;
        s = s3 + v3*tau;
    }
    else if (t<t5)
    {
        tau = t - t4;
        j = -jm;
        a = -jm*tau;
        v = v4 - jm*tau*tau / 2;
        s = s4 + v4*tau - jm*tau*tau*tau / 6;
    }
    else if (t<t6)
    {
        tau = t - t5;
        j = 0;
        a = -dm;
        v = v5 - dm*tau;
        s = s5 + v5*tau - jm*T5*tau*tau / 2;
    }
    else
    {
        tau = t - t6;
        j = jm;
        a = -dm + jm*tau;
        v = v6 - dm*tau + jm*tau*tau / 2;
        s = s6 + v6*tau - jm*T5*tau*tau / 2 + jm*tau*tau*tau / 6;
    }
    // 若反转，则输出变量做相应调整
    if (p1 >= p0) //正向运动
    {
        traj->jrk = j;
        traj->acc = a;
        traj->vel = v;
        traj->pos = p0 + s;
    }
    else         //反向运动   
    {
        traj->jrk = -j;
        traj->acc = -a;
        traj->vel = -v;
        traj->pos = p0 - s;
    }
    return HKA_STS_OK;
}

void mexFunction (int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);
    plhs[1] = mxCreateDoubleMatrix(1, 1, mxREAL);
    plhs[2] = mxCreateDoubleMatrix(1, 1, mxREAL);
    plhs[3] = mxCreateDoubleMatrix(1, 1, mxREAL);
    double *ptr_pos = mxGetPr(plhs[0]);
    double *ptr_vel = mxGetPr(plhs[1]);
    double *ptr_acc = mxGetPr(plhs[2]);
    double *ptr_jrk = mxGetPr(plhs[3]);

    double *ptr_T  = mxGetPr(prhs[0]);
    double *ptr_p0 = mxGetPr(prhs[1]);
    double *ptr_p1 = mxGetPr(prhs[2]);
    double *ptr_jm = mxGetPr(prhs[3]);
    double *ptr_t  = mxGetPr(prhs[4]);

     
    HKA_STATUS sts = HKA_STS_OK; //输出接口变量
     
    //将输入从*ptr_q存入变量q[6]
    TRAJ_INPUT input;
    input.p0 = *ptr_p0;
    input.p1 = *ptr_p1;
    input.jm = *ptr_jm;
    //input.am = *ptr_am;
    //input.dm = *ptr_am;
    //input.vm = *ptr_vm;
    //input.Tt = *ptr_Tt;
    input.dt = 2e-4; //求解精度
    
    //中间运算
    //HKA_F64 T[7] = { 0 };
    double t = *ptr_t;
    TRAJ_TRAJ traj;
    
    //sts = TRAJ_SCURVE_get_intervals(&input, T);
    sts = TRAJ_SCURVE_get_time_pos_vel_acc_jrk(&input, ptr_T, t, &traj);
    
    //输出
    *ptr_pos = traj.pos;
    *ptr_vel = traj.vel;
    *ptr_acc = traj.acc;
    *ptr_jrk = traj.jrk;
}
