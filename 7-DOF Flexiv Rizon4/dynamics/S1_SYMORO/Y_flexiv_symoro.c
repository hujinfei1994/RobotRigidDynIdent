#include "mex.h"
#include "math.h"
#include "Y_flexiv_symoro.h"
void mexFunction(int nlhs, mxArray *plhs[],  int nrhs, const mxArray *prhs[]) 
{ 
    double *q; 
    double *q_dot;
    double *q_ddot;
    //double *Mptr,*Cptr,*Gptr;
    double *Yptr;

    if((nrhs!=3)||(nlhs!=1)) 
        mexErrMsgTxt("Number of Input or Output Error!\n"); 
    if(!mxIsDouble(prhs[0]) || mxGetM(prhs[0])!=7 || mxGetN(prhs[0])!=1|| 
       !mxIsDouble(prhs[1]) || mxGetM(prhs[1])!=7 || mxGetN(prhs[1])!=1||
       !mxIsDouble(prhs[2]) || mxGetM(prhs[2])!=7 || mxGetN(prhs[2])!=1) 
        mexErrMsgTxt("Input Matrix Type Or Dimension Error!\n"); 
 
    plhs[0]=mxCreateDoubleMatrix(7,70,mxREAL);

    q  = mxGetPr(prhs[0]); 
    q_dot = mxGetPr(prhs[1]);
    q_ddot = mxGetPr(prhs[2]);

    Yptr =mxGetPr(plhs[0]);
    
    double Ys_tmp[7][70];
    //ToDo:
    Ys_matrix(q,q_dot,q_ddot,Ys_tmp);
    
    for(int i=0;i<7;i++) 
    {
        for(int j=0;j<70;j++) 
        {
            Yptr[j*7+i]=Ys_tmp[i][j];
        }
    }
  } 
