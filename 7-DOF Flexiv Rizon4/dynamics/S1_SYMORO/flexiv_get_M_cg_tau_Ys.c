#include "mex.h"
#include "math.h"
#include "flexiv_get_M_cg_tau_Ys.h"
void mexFunction(int nlhs, mxArray *plhs[],  int nrhs, const mxArray *prhs[]) 
{ 
    double *qq; 
    double *qq_dot;
    double *qq_ddot;
    double *betas;

    double *M_ptr,*cg_ptr,*tau_ptr,*Ys_ptr;

    if((nrhs!=4)||(nlhs!=4)) 
        mexErrMsgTxt("Number of Input or Output Error!\n"); 
    if(!mxIsDouble(prhs[0]) || mxGetM(prhs[0])!=7 || mxGetN(prhs[0])!=1|| 
       !mxIsDouble(prhs[1]) || mxGetM(prhs[1])!=7 || mxGetN(prhs[1])!=1|| 
       !mxIsDouble(prhs[2]) || mxGetM(prhs[2])!=7 || mxGetN(prhs[2])!=1|| 
       !mxIsDouble(prhs[3]) || mxGetM(prhs[3])!=70|| mxGetN(prhs[3])!=1) 
        mexErrMsgTxt("Input Matrix Type Or Dimension Error!\n"); 
 
    plhs[0]=mxCreateDoubleMatrix(7,7,mxREAL); //M
    plhs[1]=mxCreateDoubleMatrix(7,1,mxREAL); //cg
    plhs[2]=mxCreateDoubleMatrix(7,1,mxREAL); //tau
    plhs[3]=mxCreateDoubleMatrix(7,70,mxREAL);//Ys

    qq      = mxGetPr(prhs[0]); 
    qq_dot  = mxGetPr(prhs[1]);
    qq_ddot = mxGetPr(prhs[2]);
    betas   = mxGetPr(prhs[3]);

    M_ptr   = mxGetPr(plhs[0]);
    cg_ptr  = mxGetPr(plhs[1]);
    tau_ptr = mxGetPr(plhs[2]);
    Ys_ptr  = mxGetPr(plhs[3]);
    
    double M_tmp[7][7];
    double cg_tmp[7];
    double tau_tmp[7];
    double Ys_tmp[7][70];

    //  ‰»Î
    q1 = qq[0];
    q2 = qq[1];
    q3 = qq[2];
    q4 = qq[3];
    q5 = qq[4];
    q6 = qq[5];
    q7 = qq[6];

    qd1 = qq_dot[0];
    qd2 = qq_dot[1];
    qd3 = qq_dot[2];
    qd4 = qq_dot[3];
    qd5 = qq_dot[4];
    qd6 = qq_dot[5];
    qd7 = qq_dot[6];

    qdd1 = qq_ddot[0];
    qdd2 = qq_ddot[1];
    qdd3 = qq_ddot[2];
    qdd4 = qq_ddot[3];
    qdd5 = qq_ddot[4];
    qdd6 = qq_ddot[5];
    qdd7 = qq_ddot[6];
    
    I1xx = betas[0];  
    I1xy = betas[1];  
    I1xz = betas[2];  
    I1yy = betas[3];  
    I1yz = betas[4];  
    I1zz = betas[5];  
    mx1 = betas[6];  
    my1 = betas[7];  
    mz1 = betas[8];  
    m1 = betas[9];  

    I2xx = betas[10];  
    I2xy = betas[11];  
    I2xz = betas[12];  
    I2yy = betas[13];  
    I2yz = betas[14];  
    I2zz = betas[15];  
    mx2 = betas[16];  
    my2 = betas[17];  
    mz2 = betas[18];  
    m2 = betas[19];  

    I3xx = betas[20];  
    I3xy = betas[21];  
    I3xz = betas[22];  
    I3yy = betas[23];  
    I3yz = betas[24];  
    I3zz = betas[25];  
    mx3 = betas[26];  
    my3 = betas[27];  
    mz3 = betas[28];  
    m3 = betas[29];  

    I4xx = betas[30];  
    I4xy = betas[31];  
    I4xz = betas[32];  
    I4yy = betas[33];  
    I4yz = betas[34];  
    I4zz = betas[35];  
    mx4 = betas[36];  
    my4 = betas[37];  
    mz4 = betas[38];  
    m4 = betas[39];  

    I5xx = betas[40];  
    I5xy = betas[41];  
    I5xz = betas[42];  
    I5yy = betas[43];  
    I5yz = betas[44];  
    I5zz = betas[45];  
    mx5 = betas[46];  
    my5 = betas[47];  
    mz5 = betas[48];  
    m5 = betas[49];  

    I6xx = betas[50];  
    I6xy = betas[51];  
    I6xz = betas[52];  
    I6yy = betas[53];  
    I6yz = betas[54];  
    I6zz = betas[55];  
    mx6 = betas[56];  
    my6 = betas[57];  
    mz6 = betas[58];  
    m6 = betas[59];  

    I7xx = betas[60];  
    I7xy = betas[61];  
    I7xz = betas[62];  
    I7yy = betas[63];  
    I7yz = betas[64];  
    I7zz = betas[65];  
    mx7 = betas[66];  
    my7 = betas[67];  
    mz7 = betas[68];  
    m7 = betas[69];
    
    
    
    //º∆À„
    flexiv_get_M(M_tmp);
    flexiv_get_cg(cg_tmp);
    flexiv_get_tau(tau_tmp);
    flexiv_get_Ys(Ys_tmp);

    //  ‰≥ˆ
    for(int i=0;i<7;i++) 
    {
        for(int j=0;j<70;j++) 
        {
            Ys_ptr[j*7+i]=Ys_tmp[i][j];
        }
    }  
    for(int i=0;i<7;i++) 
    {
        for(int j=0;j<7;j++) 
        {
            M_ptr[j*7+i]=M_tmp[i][j];
        }
    }
    for(int i=0;i<7;i++) 
    {
        tau_ptr[i] = tau_tmp[i];  
    }
    for(int i=0;i<7;i++) 
    {
        cg_ptr[i] = cg_tmp[i];  
    }
    
} 
