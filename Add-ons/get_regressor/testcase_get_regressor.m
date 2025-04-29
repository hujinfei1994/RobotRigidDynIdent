clear;clc;
syms beta1 beta2 beta3 real
syms x1 x2 x3 real
f = beta1*x1+beta2*x1*x2+beta3*x3;
beta = {'beta1','beta2','beta3','beta4'};

%% 验证不同的beta_select
beta_select = beta;
Y1 = get_regressor(f,beta,beta_select)

beta_select = {'beta1','beta2'};
Y2 = get_regressor(f,beta,beta_select)

beta_select = {'beta2'};
Y3 = get_regressor(f,beta,beta_select)

beta_select = {'beta2','beta3'};
Y3 = get_regressor(f,beta,beta_select)
