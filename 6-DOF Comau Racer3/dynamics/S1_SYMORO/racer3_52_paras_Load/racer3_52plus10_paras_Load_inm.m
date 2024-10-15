% (********************************************)
% (** SYMORO+ : SYmbolic MOdelling of RObots **)
% (**========================================**)
% (**      IRCCyN-ECN - 1, rue de la Noe     **)
% (**      B.P.92101                         **)
% (**      44321 Nantes cedex 3, FRANCE      **)
% (**      www.irccyn.ec-nantes.fr           **)
% (********************************************)


%    Name of file : C:/Users/Administrator/Desktop/SYMORO_WS/Robots/racer3_52_paras_Load/racer3_52plus10_paras_Load.inm




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

% 7        6        0        2        0        0        0        0        0        L6




%              Inertial parameters

% j      XX     XY     XZ     YY     YZ     ZZ     MX     MY     MZ     M      Ia

% 1      I1xx   I1xy   I1xz   I1yy   I1yz   I1zz   mx1    my1    mz1    m1     Ia1

% 2      I2xx   I2xy   I2xz   I2yy   I2yz   I2zz   mx2    my2    mz2    m2     Ia2

% 3      I3xx   I3xy   I3xz   I3yy   I3yz   I3zz   mx3    my3    mz3    m3     Ia3

% 4      I4xx   I4xy   I4xz   I4yy   I4yz   I4zz   mx4    my4    mz4    m4     Ia4

% 5      I5xx   I5xy   I5xz   I5yy   I5yz   I5zz   mx5    my5    mz5    m5     Ia5

% 6      I6xx   I6xy   I6xz   I6yy   I6yz   I6zz   mx6    my6    mz6    m6     Ia6

% 7      ILxx   ILxy   ILxz   ILyy   ILyz   ILzz   mxL    myL    mzL    mL     0

%                       Inertia matrix
% Equations:

% Declaration of the function
function racer3_52plus10_paras_Load_inm()

% Declaration of global input variables
global q2 q3 q4 q5 q6 L6 mzL mxL myL I6xx
global ILxx mL I6xy ILxy I6xz ILxz I6yy ILyy I6yz ILyz
global I6zz ILzz mx6 my6 mz6 m6 I5xx I5xy I5xz I5yy
global I5yz I5zz mx5 my5 mz5 m5 I4xx I4xy I4xz I4yy
global I4yz I4zz mx4 my4 mz4 m4 L5 L4 I3xx I3xy
global I3xz I3yy I3yz I3zz mx3 my3 mz3 m3 L3 I2xx
global I2xy I2xz I2yy I2yz I2zz mx2 my2 m2 L1 I1zz
global Ia1 Ia2 Ia3 Ia4 Ia5 Ia6

% Declaration of global output variables
global A

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
	PAS117=-(L6.*mzL);
	PAS137=L6.*mxL;
	PAS227=-(L6.*mzL);
	PAS237=L6.*myL;
	XXP6=I6xx + ILxx + L6.^2.*mL - 2.*PAS117;
	XYP6=I6xy + ILxy;
	XZP6=I6xz + ILxz - PAS137;
	YYP6=I6yy + ILyy + L6.^2.*mL - 2.*PAS227;
	YZP6=I6yz + ILyz - PAS237;
	ZZP6=I6zz + ILzz;
	MXP6=mx6 + mxL;
	MYP6=my6 + myL;
	MZP6=L6.*mL + mz6 + mzL;
	MP6=m6 + mL;
	AS16=C6.*MXP6 - MYP6.*S6;
	AS36=-(C6.*MYP6) - MXP6.*S6;
	AJ116=-((I6xy + ILxy).*S6) + C6.*XXP6;
	AJ126=C6.*XYP6 - S6.*YYP6;
	AJ136=C6.*XZP6 - S6.*YZP6;
	AJ216=I6xz + ILxz - PAS137;
	AJ226=I6yz + ILyz - PAS237;
	AJ316=-(C6.*(I6xy + ILxy)) - S6.*XXP6;
	AJ326=-(S6.*XYP6) - C6.*YYP6;
	AJ336=-(S6.*XZP6) - C6.*YZP6;
	AJA116=AJ116.*C6 - AJ126.*S6;
	AJA216=AJ216.*C6 - AJ226.*S6;
	AJA316=AJ316.*C6 - AJ326.*S6;
	AJA336=-(AJ326.*C6) - AJ316.*S6;
	XXP5=AJA116 + I5xx;
	XYP5=AJA216 + I5xy;
	XZP5=AJA316 + I5xz;
	YYP5=I5yy + ZZP6;
	YZP5=AJ336 + I5yz;
	ZZP5=AJA336 + I5zz;
	MXP5=AS16 + mx5;
	MYP5=my5 + MZP6;
	MZP5=AS36 + mz5;
	MP5=m5 + MP6;
	AS15=C5.*MXP5 - MYP5.*S5;
	AS35=C5.*MYP5 + MXP5.*S5;
	AJ115=-((AJA216 + I5xy).*S5) + C5.*XXP5;
	AJ125=C5.*XYP5 - S5.*YYP5;
	AJ135=C5.*XZP5 - S5.*YZP5;
	AJ215=-AJA316 - I5xz;
	AJ225=-AJ336 - I5yz;
	AJ315=C5.*(AJA216 + I5xy) + S5.*XXP5;
	AJ325=S5.*XYP5 + C5.*YYP5;
	AJ335=S5.*XZP5 + C5.*YZP5;
	AJA115=AJ115.*C5 - AJ125.*S5;
	AJA215=AJ215.*C5 - AJ225.*S5;
	AJA315=AJ315.*C5 - AJ325.*S5;
	AJA335=AJ325.*C5 + AJ315.*S5;
	XXP4=AJA115 + I4xx;
	XYP4=AJA215 + I4xy;
	XZP4=AJA315 + I4xz;
	YYP4=I4yy + ZZP5;
	YZP4=-AJ335 + I4yz;
	ZZP4=AJA335 + I4zz;
	MXP4=AS15 + mx4;
	MYP4=my4 - MZP5;
	MZP4=AS35 + mz4;
	MP4=m4 + MP5;
	AS14=C4.*MXP4 - MYP4.*S4;
	AS34=-(C4.*MYP4) - MXP4.*S4;
	AJ114=-((AJA215 + I4xy).*S4) + C4.*XXP4;
	AJ124=C4.*XYP4 - S4.*YYP4;
	AJ134=C4.*XZP4 - S4.*YZP4;
	AJ214=AJA315 + I4xz;
	AJ224=-AJ335 + I4yz;
	AJ314=-(C4.*(AJA215 + I4xy)) - S4.*XXP4;
	AJ324=-(S4.*XYP4) - C4.*YYP4;
	AJ334=-(S4.*XZP4) - C4.*YZP4;
	AJA114=AJ114.*C4 - AJ124.*S4;
	AJA214=AJ214.*C4 - AJ224.*S4;
	AJA314=AJ314.*C4 - AJ324.*S4;
	AJA334=-(AJ324.*C4) - AJ314.*S4;
	PAS114=-(L5.*MZP4);
	PAS124=AS14.*L5;
	PAS214=L4.*MZP4;
	PAS224=-(AS14.*L4);
	PAS314=AS34.*L4;
	PAS324=AS34.*L5;
	PAS334=-(AS14.*L4) - L5.*MZP4;
	XXP3=AJA114 + I3xx + L5.^2.*MP4 - 2.*PAS114;
	XYP3=AJA214 + I3xy - L4.*L5.*MP4 - PAS124 - PAS214;
	XZP3=AJA314 + I3xz - PAS314;
	YYP3=I3yy + L4.^2.*MP4 - 2.*PAS224 + ZZP4;
	YZP3=AJ334 + I3yz - PAS324;
	ZZP3=AJA334 + I3zz + (L4.^2 + L5.^2).*MP4 - 2.*PAS334;
	MXP3=AS14 + L4.*MP4 + mx3;
	MYP3=L5.*MP4 + my3 + MZP4;
	MZP3=AS34 + mz3;
	MP3=m3 + MP4;
	AS13=C3.*MXP3 - MYP3.*S3;
	AS23=C3.*MYP3 + MXP3.*S3;
	AJ113=-((AJA214 + I3xy - L4.*L5.*MP4 - PAS124 - PAS214).*S3) + C3.*XXP3;
	AJ123=C3.*XYP3 - S3.*YYP3;
	AJ133=C3.*XZP3 - S3.*YZP3;
	AJ213=C3.*(AJA214 + I3xy - L4.*L5.*MP4 - PAS124 - PAS214) + S3.*XXP3;
	AJ223=S3.*XYP3 + C3.*YYP3;
	AJ233=S3.*XZP3 + C3.*YZP3;
	AJ313=AJA314 + I3xz - PAS314;
	AJ323=AJ334 + I3yz - PAS324;
	AJA113=AJ113.*C3 - AJ123.*S3;
	AJA213=AJ213.*C3 - AJ223.*S3;
	AJA313=AJ313.*C3 - AJ323.*S3;
	AJA223=AJ223.*C3 + AJ213.*S3;
	AJA323=AJ323.*C3 + AJ313.*S3;
	PAS213=AS23.*L3;
	PAS223=-(AS13.*L3);
	PAS313=L3.*MZP3;
	PAS333=-(AS13.*L3);
	XXP2=AJA113 + I2xx;
	XYP2=AJA213 + I2xy - PAS213;
	XZP2=AJA313 + I2xz - PAS313;
	YYP2=AJA223 + I2yy + L3.^2.*MP3 - 2.*PAS223;
	YZP2=AJA323 + I2yz;
	ZZP2=I2zz + L3.^2.*MP3 - 2.*PAS333 + ZZP3;
	MXP2=AS13 + L3.*MP3 + mx2;
	MYP2=AS23 + my2;
	MP2=m2 + MP3;
	AS12=C2.*MXP2 - MYP2.*S2;
	AJ312=-(C2.*(AJA213 + I2xy - PAS213)) - S2.*XXP2;
	AJ322=-(S2.*XYP2) - C2.*YYP2;
	AJ332=-(S2.*XZP2) - C2.*YZP2;
	AJA332=-(AJ322.*C2) - AJ312.*S2;
	PAS332=-(AS12.*L1);
	ZZP1=AJA332 + I1zz + L1.^2.*MP2 - 2.*PAS332;
	EC22=C3.*MXP3 - MYP3.*S3;
	NC32=EC22.*L3 + ZZP3;
	NC33=-(AJ233.*C2) - AJ133.*S2;
	ED12=-(C4.*MYP4) - MXP4.*S4;
	ED32=-(C4.*MXP4) + MYP4.*S4;
	ND12=AJ134 + ED32.*L5;
	ND22=-(ED32.*L4) + ZZP4;
	ND32=AJ334 - ED12.*L5;
	ED23=ED12.*S3;
	ND13=C3.*ND12 - ND22.*S3;
	ND23=-(ED32.*L3) + C3.*ND22 + ND12.*S3;
	ND33=ED23.*L3 + ND32;
	ND34=ED32.*L1 - C2.*ND23 - ND13.*S2;
	EE12=-(C5.*MYP5) - MXP5.*S5;
	EE32=C5.*MXP5 - MYP5.*S5;
	EE13=C4.*EE12;
	EE33=-(EE12.*S4);
	NE13=AJ135.*C4 + EE33.*L5 + S4.*ZZP5;
	NE23=AJ335 - EE33.*L4;
	NE33=EE32.*L4 - EE13.*L5 - AJ135.*S4 + C4.*ZZP5;
	EE24=C3.*EE32 + EE13.*S3;
	NE14=C3.*NE13 - NE23.*S3;
	NE24=-(EE33.*L3) + C3.*NE23 + NE13.*S3;
	NE34=EE24.*L3 + NE33;
	NE35=EE33.*L1 - C2.*NE24 - NE14.*S2;
	EF12=-(C6.*MYP6) - MXP6.*S6;
	EF32=-(C6.*MXP6) + MYP6.*S6;
	EF13=C5.*EF12;
	EF33=EF12.*S5;
	NF13=AJ136.*C5 - S5.*ZZP6;
	NF33=AJ136.*S5 + C5.*ZZP6;
	EF14=C4.*EF13 + EF32.*S4;
	EF34=C4.*EF32 - EF13.*S4;
	NF14=EF34.*L5 + C4.*NF13 + AJ336.*S4;
	NF24=-(EF34.*L4) + NF33;
	NF34=AJ336.*C4 + EF33.*L4 - EF14.*L5 - NF13.*S4;
	EF25=C3.*EF33 + EF14.*S3;
	NF15=C3.*NF14 - NF24.*S3;
	NF25=-(EF34.*L3) + C3.*NF24 + NF14.*S3;
	NF35=EF25.*L3 + NF34;
	NF36=EF34.*L1 - C2.*NF25 - NF15.*S2;
	A(1,1)=Ia1 + ZZP1;
	A(2,1)=AJ332;
	A(3,1)=NC33;
	A(4,1)=ND34;
	A(5,1)=NE35;
	A(6,1)=NF36;
	A(2,2)=Ia2 + ZZP2;
	A(3,2)=NC32;
	A(4,2)=ND33;
	A(5,2)=NE34;
	A(6,2)=NF35;
	A(3,3)=Ia3 + ZZP3;
	A(4,3)=ND32;
	A(5,3)=NE33;
	A(6,3)=NF34;
	A(4,4)=Ia4 + ZZP4;
	A(5,4)=AJ335;
	A(6,4)=NF33;
	A(5,5)=Ia5 + ZZP5;
	A(6,5)=AJ336;
	A(6,6)=Ia6 + ZZP6;


% *=*
% Number of operations : 217 '+' or '-', 240 '*' or '/'

%  QDP= 
% {qdd1, qdd2, qdd3, qdd4, qdd5, qdd6}

