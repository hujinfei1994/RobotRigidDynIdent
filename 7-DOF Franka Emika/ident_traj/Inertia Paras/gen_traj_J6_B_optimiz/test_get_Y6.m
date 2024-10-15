load save_x.mat
global T N
T = 10;
N = 5;

% t
t = 1.2;

% x
A1 = ones(5,1)*0.3;
B1 = ones(5,1)*0.2;
C1 = 0.1;

x0(1:5)   = A1;
x0(6:10)  = B1;
x0(11)    = C1;

Y6 = get_Y6(x0,t)
