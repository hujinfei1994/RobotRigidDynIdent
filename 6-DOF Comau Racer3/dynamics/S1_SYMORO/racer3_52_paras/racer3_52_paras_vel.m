% (********************************************)
% (** SYMORO+ : SYmbolic MOdelling of RObots **)
% (**========================================**)
% (**      IRCCyN-ECN - 1, rue de la Noe     **)
% (**      B.P.92101                         **)
% (**      44321 Nantes cedex 3, FRANCE      **)
% (**      www.irccyn.ec-nantes.fr           **)
% (********************************************)


%    Name of file : C:/Users/Administrator/Desktop/SYMORO_WS/Robots/racer3_48_paras/racer3_52_paras.vel




%      Geometric parameters   


% j        ant      mu       sigma    gamma    b        alpha    d        theta    r


% 1        0        1        0        0        0        0        0        q1       L2

%                                                       -Pi               -Pi
% 2        1        1        0        0        0        ---      L1       --- + q2 0
%                                                        2                 2

% 3        2        1        0        0        0        0        L3       q3       0

%                                                       -Pi
% 4        3        1        0        0        0        ---      L4       q4       L5
%                                                        2
%                                                       Pi
% 5        4        1        0        0        0        --       0        q5       0
%                                                       2
%                                                       -Pi
% 6        5        1        0        0        0        ---      0        q6       0
%                                                        2

%                Velocity of links 


% Equations:

% Declaration of the function
function racer3_52_paras_vel()

% Declaration of global input variables
global q2 q3 q4 q5 q6 qd1 qd2 L1 qd3 L3
global qd4 L5 L4 qd5 qd6

% Declaration of global output variables
global W11 W21 W31 V11 V21 V31 W12 W22 W32 V12
global V22 V32 W13 W23 W33 V13 V23 V33 W14 W24
global W34 V14 V24 V34 W15 W25 W35 V15 V25 V35
global W16 W26 W36 V16 V26 V36

% Function description:

	S2=-cos(q2);
	C2=sin(q2);
	S3=sin(q3);
	C3=cos(q3);
	S4=sin(q4);
	C4=cos(q4);
	S5=sin(q5);
	C5=cos(q5);
	S6=sin(q6);
	C6=cos(q6);
	W11=0;
	W21=0;
	W31=qd1;
	V11=0;
	V21=0;
	V31=0;
	W12=-(qd1.*S2);
	W22=-(C2.*qd1);
	W32=qd2;
	V12=0;
	V22=0;
	V32=L1.*qd1;
	W13=C3.*W12 + S3.*W22;
	W23=-(S3.*W12) + C3.*W22;
	W33=qd2 + qd3;
	V13=L3.*qd2.*S3;
	V23=C3.*L3.*qd2;
	V33=V32 - L3.*W22;
	W14=C4.*W13 - S4.*W33;
	W24=-(S4.*W13) - C4.*W33;
	W34=qd4 + W23;
	V14=-(S4.*(V33 + L5.*W13 - L4.*W23)) + C4.*(V13 - L5.*W33);
	V24=-(C4.*(V33 + L5.*W13 - L4.*W23)) - S4.*(V13 - L5.*W33);
	V34=V23 + L4.*W33;
	W15=C5.*W14 + S5.*W34;
	W25=-(S5.*W14) + C5.*W34;
	W35=qd5 - W24;
	V15=C5.*V14 + S5.*V34;
	V25=-(S5.*V14) + C5.*V34;
	V35=-V24;
	W16=C6.*W15 - S6.*W35;
	W26=-(S6.*W15) - C6.*W35;
	W36=qd6 + W25;
	V16=C6.*V15 + S6.*V24;
	V26=-(S6.*V15) + C6.*V24;
	V36=V25;


% *=*
% Number of operations : 26 '+' or '-', 43 '*' or '/'
