% (********************************************)
% (** SYMORO+ : SYmbolic MOdelling of RObots **)
% (**========================================**)
% (**      IRCCyN-ECN - 1, rue de la Noe     **)
% (**      B.P.92101                         **)
% (**      44321 Nantes cedex 3, FRANCE      **)
% (**      www.irccyn.ec-nantes.fr           **)
% (********************************************)


%    Name of file : C:/Users/73183/Desktop/SYMORO_WS/franka/franka_noload.inm




%      Geometric parameters   


% j     ant   mu    sigma gamma b     alpha d     theta r


% 1     0     1     0     0     0     0     0     q1    L4

%                                     -Pi
% 2     1     1     0     0     0     ---   0     q2    0
%                                      2
%                                     Pi
% 3     2     1     0     0     0     --    0     q3    L5
%                                     2
%                                     Pi
% 4     3     1     0     0     0     --    L1    q4    0
%                                     2
%                                     -Pi
% 5     4     1     0     0     0     ---   L2    q5    L6
%                                      2
%                                     Pi
% 6     5     1     0     0     0     --    0     q6    0
%                                     2
%                                     Pi
% 7     6     1     0     0     0     --    L3    q7    0
%                                     2



%              Inertial parameters

% j      XX     XY     XZ     YY     YZ     ZZ     MX     MY     MZ     M      Ia

% 1      I1xx   I1xy   I1xz   I1yy   I1yz   I1zz   mx1    my1    mz1    m1     Ia1

% 2      I2xx   I2xy   I2xz   I2yy   I2yz   I2zz   mx2    my2    mz2    m2     Ia2

% 3      I3xx   I3xy   I3xz   I3yy   I3yz   I3zz   mx3    my3    mz3    m3     Ia3

% 4      I4xx   I4xy   I4xz   I4yy   I4yz   I4zz   mx4    my4    mz4    m4     Ia4

% 5      I5xx   I5xy   I5xz   I5yy   I5yz   I5zz   mx5    my5    mz5    m5     Ia5

% 6      I6xx   I6xy   I6xz   I6yy   I6yz   I6zz   mx6    my6    mz6    m6     Ia6

% 7      I7xx   I7xy   I7xz   I7yy   I7yz   I7zz   mx7    my7    mz7    m7     Ia7

%                       Inertia matrix
% Equations:

% Declaration of the function
function franka_noload_inm()

% Declaration of global input variables
global q2 q3 q4 q5 q6 q7 mx7 my7 I7xx I7xy
global I7yy I7xz I7yz L3 mz7 I6xx I6xy I6xz I6yy I7zz
global m7 I6yz I6zz mx6 my6 mz6 m6 I5xx I5xy I5xz
global I5yy I5yz I5zz mx5 my5 mz5 m5 L6 L2 I4xx
global I4xy I4xz I4yy I4yz I4zz mx4 my4 mz4 m4 L1
global I3xx I3xy I3xz I3yy I3yz I3zz mx3 my3 mz3 m3
global L5 I2xx I2xy I2xz I2yy I2yz I2zz I1zz Ia1 Ia2
global Ia3 Ia4 Ia5 Ia6 Ia7

% Declaration of global output variables
global A

% Function description:

	S2=sin(q2);
	C2=cos(q2);
	S3=sin(q3);
	C3=cos(q3);
	S4=sin(q4);
	C4=cos(q4);
	S5=sin(q5);
	C5=cos(q5);
	S6=sin(q6);
	C6=cos(q6);
	S7=sin(q7);
	C7=cos(q7);
	AS17=C7.*mx7 - my7.*S7;
	AS37=C7.*my7 + mx7.*S7;
	AJ117=C7.*I7xx - I7xy.*S7;
	AJ127=C7.*I7xy - I7yy.*S7;
	AJ137=C7.*I7xz - I7yz.*S7;
	AJ317=C7.*I7xy + I7xx.*S7;
	AJ327=C7.*I7yy + I7xy.*S7;
	AJ337=C7.*I7yz + I7xz.*S7;
	AJA117=AJ117.*C7 - AJ127.*S7;
	AJA217=-(C7.*I7xz) + I7yz.*S7;
	AJA317=AJ317.*C7 - AJ327.*S7;
	AJA337=AJ327.*C7 + AJ317.*S7;
	PAS217=-(L3.*mz7);
	PAS227=-(AS17.*L3);
	PAS317=AS37.*L3;
	PAS337=-(AS17.*L3);
	XXP6=AJA117 + I6xx;
	XYP6=AJA217 + I6xy - PAS217;
	XZP6=AJA317 + I6xz - PAS317;
	YYP6=I6yy + I7zz + L3.^2.*m7 - 2.*PAS227;
	YZP6=-AJ337 + I6yz;
	ZZP6=AJA337 + I6zz + L3.^2.*m7 - 2.*PAS337;
	MXP6=AS17 + L3.*m7 + mx6;
	MYP6=my6 - mz7;
	MZP6=AS37 + mz6;
	MP6=m6 + m7;
	AS16=C6.*MXP6 - MYP6.*S6;
	AS36=C6.*MYP6 + MXP6.*S6;
	AJ116=-((AJA217 + I6xy - PAS217).*S6) + C6.*XXP6;
	AJ126=C6.*XYP6 - S6.*YYP6;
	AJ136=C6.*XZP6 - S6.*YZP6;
	AJ216=-AJA317 - I6xz + PAS317;
	AJ226=AJ337 - I6yz;
	AJ316=C6.*(AJA217 + I6xy - PAS217) + S6.*XXP6;
	AJ326=S6.*XYP6 + C6.*YYP6;
	AJ336=S6.*XZP6 + C6.*YZP6;
	AJA116=AJ116.*C6 - AJ126.*S6;
	AJA216=AJ216.*C6 - AJ226.*S6;
	AJA316=AJ316.*C6 - AJ326.*S6;
	AJA336=AJ326.*C6 + AJ316.*S6;
	XXP5=AJA116 + I5xx;
	XYP5=AJA216 + I5xy;
	XZP5=AJA316 + I5xz;
	YYP5=I5yy + ZZP6;
	YZP5=-AJ336 + I5yz;
	ZZP5=AJA336 + I5zz;
	MXP5=AS16 + mx5;
	MYP5=my5 - MZP6;
	MZP5=AS36 + mz5;
	MP5=m5 + MP6;
	AS15=C5.*MXP5 - MYP5.*S5;
	AS35=-(C5.*MYP5) - MXP5.*S5;
	AJ115=-((AJA216 + I5xy).*S5) + C5.*XXP5;
	AJ125=C5.*XYP5 - S5.*YYP5;
	AJ135=C5.*XZP5 - S5.*YZP5;
	AJ215=AJA316 + I5xz;
	AJ225=-AJ336 + I5yz;
	AJ315=-(C5.*(AJA216 + I5xy)) - S5.*XXP5;
	AJ325=-(S5.*XYP5) - C5.*YYP5;
	AJ335=-(S5.*XZP5) - C5.*YZP5;
	AJA115=AJ115.*C5 - AJ125.*S5;
	AJA215=AJ215.*C5 - AJ225.*S5;
	AJA315=AJ315.*C5 - AJ325.*S5;
	AJA335=-(AJ325.*C5) - AJ315.*S5;
	PAS115=-(L6.*MZP5);
	PAS125=AS15.*L6;
	PAS215=L2.*MZP5;
	PAS225=-(AS15.*L2);
	PAS315=AS35.*L2;
	PAS325=AS35.*L6;
	PAS335=-(AS15.*L2) - L6.*MZP5;
	XXP4=AJA115 + I4xx + L6.^2.*MP5 - 2.*PAS115;
	XYP4=AJA215 + I4xy - L2.*L6.*MP5 - PAS125 - PAS215;
	XZP4=AJA315 + I4xz - PAS315;
	YYP4=I4yy + L2.^2.*MP5 - 2.*PAS225 + ZZP5;
	YZP4=AJ335 + I4yz - PAS325;
	ZZP4=AJA335 + I4zz + (L2.^2 + L6.^2).*MP5 - 2.*PAS335;
	MXP4=AS15 + L2.*MP5 + mx4;
	MYP4=L6.*MP5 + my4 + MZP5;
	MZP4=AS35 + mz4;
	MP4=m4 + MP5;
	AS14=C4.*MXP4 - MYP4.*S4;
	AS34=C4.*MYP4 + MXP4.*S4;
	AJ114=-((AJA215 + I4xy - L2.*L6.*MP5 - PAS125 - PAS215).*S4) + C4.*XXP4;
	AJ124=C4.*XYP4 - S4.*YYP4;
	AJ134=C4.*XZP4 - S4.*YZP4;
	AJ214=-AJA315 - I4xz + PAS315;
	AJ224=-AJ335 - I4yz + PAS325;
	AJ314=C4.*(AJA215 + I4xy - L2.*L6.*MP5 - PAS125 - PAS215) + S4.*XXP4;
	AJ324=S4.*XYP4 + C4.*YYP4;
	AJ334=S4.*XZP4 + C4.*YZP4;
	AJA114=AJ114.*C4 - AJ124.*S4;
	AJA214=AJ214.*C4 - AJ224.*S4;
	AJA314=AJ314.*C4 - AJ324.*S4;
	AJA334=AJ324.*C4 + AJ314.*S4;
	PAS214=-(L1.*MZP4);
	PAS224=-(AS14.*L1);
	PAS314=AS34.*L1;
	PAS334=-(AS14.*L1);
	XXP3=AJA114 + I3xx;
	XYP3=AJA214 + I3xy - PAS214;
	XZP3=AJA314 + I3xz - PAS314;
	YYP3=I3yy + L1.^2.*MP4 - 2.*PAS224 + ZZP4;
	YZP3=-AJ334 + I3yz;
	ZZP3=AJA334 + I3zz + L1.^2.*MP4 - 2.*PAS334;
	MXP3=AS14 + L1.*MP4 + mx3;
	MYP3=my3 - MZP4;
	MZP3=AS34 + mz3;
	MP3=m3 + MP4;
	AS13=C3.*MXP3 - MYP3.*S3;
	AS33=C3.*MYP3 + MXP3.*S3;
	AJ113=-((AJA214 + I3xy - PAS214).*S3) + C3.*XXP3;
	AJ123=C3.*XYP3 - S3.*YYP3;
	AJ133=C3.*XZP3 - S3.*YZP3;
	AJ213=-AJA314 - I3xz + PAS314;
	AJ223=AJ334 - I3yz;
	AJ313=C3.*(AJA214 + I3xy - PAS214) + S3.*XXP3;
	AJ323=S3.*XYP3 + C3.*YYP3;
	AJ333=S3.*XZP3 + C3.*YZP3;
	AJA113=AJ113.*C3 - AJ123.*S3;
	AJA213=AJ213.*C3 - AJ223.*S3;
	AJA313=AJ313.*C3 - AJ323.*S3;
	AJA333=AJ323.*C3 + AJ313.*S3;
	PAS113=-(L5.*MZP3);
	PAS123=-(AS13.*L5);
	PAS323=-(AS33.*L5);
	PAS333=-(L5.*MZP3);
	XXP2=AJA113 + I2xx + L5.^2.*MP3 - 2.*PAS113;
	XYP2=AJA213 + I2xy - PAS123;
	XZP2=AJA313 + I2xz;
	YYP2=I2yy + ZZP3;
	YZP2=-AJ333 + I2yz - PAS323;
	ZZP2=AJA333 + I2zz + L5.^2.*MP3 - 2.*PAS333;
	AJ312=-(C2.*(AJA213 + I2xy - PAS123)) - S2.*XXP2;
	AJ322=-(S2.*XYP2) - C2.*YYP2;
	AJ332=-(S2.*XZP2) - C2.*YZP2;
	AJA332=-(AJ322.*C2) - AJ312.*S2;
	ZZP1=AJA332 + I1zz;
	EC12=-(C3.*MYP3) - MXP3.*S3;
	EC32=C3.*MXP3 - MYP3.*S3;
	NC12=AJ133 - EC32.*L5;
	NC32=AJ333 + EC12.*L5;
	NC33=-(NC12.*S2) + C2.*ZZP3;
	ED12=-(C4.*MYP4) - MXP4.*S4;
	ED32=C4.*MXP4 - MYP4.*S4;
	ND22=-(ED32.*L1) - ZZP4;
	ED13=C3.*ED12;
	ED33=ED12.*S3;
	ND13=AJ134.*C3 - ED33.*L5 - ND22.*S3;
	ND33=ED13.*L5 + C3.*ND22 + AJ134.*S3;
	ND34=AJ334.*C2 - ND13.*S2;
	EE12=-(C5.*MYP5) - MXP5.*S5;
	EE32=-(C5.*MXP5) + MYP5.*S5;
	NE12=AJ135 + EE32.*L6;
	NE22=-(EE32.*L2) + ZZP5;
	NE32=AJ335 - EE12.*L6;
	EE13=C4.*EE12;
	EE33=EE12.*S4;
	NE13=C4.*NE12 - NE22.*S4;
	NE23=-(EE33.*L1) - NE32;
	NE33=-(EE32.*L1) + C4.*NE22 + NE12.*S4;
	EE14=C3.*EE13 + EE32.*S3;
	EE34=-(C3.*EE32) + EE13.*S3;
	NE14=-(EE34.*L5) + C3.*NE13 - NE23.*S3;
	NE34=EE14.*L5 + C3.*NE23 + NE13.*S3;
	NE35=C2.*NE33 - NE14.*S2;
	EF12=-(C6.*MYP6) - MXP6.*S6;
	EF32=C6.*MXP6 - MYP6.*S6;
	EF13=C5.*EF12;
	EF33=-(EF12.*S5);
	NF13=AJ136.*C5 + EF33.*L6 + S5.*ZZP6;
	NF23=AJ336 - EF33.*L2;
	NF33=EF32.*L2 - EF13.*L6 - AJ136.*S5 + C5.*ZZP6;
	EF14=C4.*EF13 - EF32.*S4;
	EF34=C4.*EF32 + EF13.*S4;
	NF14=C4.*NF13 - NF23.*S4;
	NF24=-(EF34.*L1) - NF33;
	NF34=-(EF33.*L1) + C4.*NF23 + NF13.*S4;
	EF15=C3.*EF14 + EF33.*S3;
	EF35=-(C3.*EF33) + EF14.*S3;
	NF15=-(EF35.*L5) + C3.*NF14 - NF24.*S3;
	NF35=EF15.*L5 + C3.*NF24 + NF14.*S3;
	NF36=C2.*NF34 - NF15.*S2;
	EG12=-(C7.*my7) - mx7.*S7;
	EG32=C7.*mx7 - my7.*S7;
	NG22=-I7zz - EG32.*L3;
	EG13=C6.*EG12;
	EG33=EG12.*S6;
	NG13=AJ137.*C6 - NG22.*S6;
	NG33=C6.*NG22 + AJ137.*S6;
	EG14=C5.*EG13 + EG32.*S5;
	EG34=C5.*EG32 - EG13.*S5;
	NG14=EG34.*L6 + C5.*NG13 + AJ337.*S5;
	NG24=-(EG34.*L2) + NG33;
	NG34=AJ337.*C5 + EG33.*L2 - EG14.*L6 - NG13.*S5;
	EG15=C4.*EG14 - EG33.*S4;
	EG35=C4.*EG33 + EG14.*S4;
	NG15=C4.*NG14 - NG24.*S4;
	NG25=-(EG35.*L1) - NG34;
	NG35=-(EG34.*L1) + C4.*NG24 + NG14.*S4;
	EG16=C3.*EG15 + EG34.*S3;
	EG36=-(C3.*EG34) + EG15.*S3;
	NG16=-(EG36.*L5) + C3.*NG15 - NG25.*S3;
	NG36=EG16.*L5 + C3.*NG25 + NG15.*S3;
	NG37=C2.*NG35 - NG16.*S2;
	A(1,1)=Ia1 + ZZP1;
	A(2,1)=AJ332;
	A(3,1)=NC33;
	A(4,1)=ND34;
	A(5,1)=NE35;
	A(6,1)=NF36;
	A(7,1)=NG37;
	A(2,2)=Ia2 + ZZP2;
	A(3,2)=NC32;
	A(4,2)=ND33;
	A(5,2)=NE34;
	A(6,2)=NF35;
	A(7,2)=NG36;
	A(3,3)=Ia3 + ZZP3;
	A(4,3)=AJ334;
	A(5,3)=NE33;
	A(6,3)=NF34;
	A(7,3)=NG35;
	A(4,4)=Ia4 + ZZP4;
	A(5,4)=NE32;
	A(6,4)=NF33;
	A(7,4)=NG34;
	A(5,5)=Ia5 + ZZP5;
	A(6,5)=AJ336;
	A(7,5)=NG33;
	A(6,6)=Ia6 + ZZP6;
	A(7,6)=AJ337;
	A(7,7)=I7zz + Ia7;


% *=*
% Number of operations : 261 '+' or '-', 317 '*' or '/'

%  QDP= 
% {qdd1, qdd2, qdd3, qdd4, qdd5, qdd6, qdd7}

