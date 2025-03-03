%% syms def
clear;clc;
syms q1 q2 q3 q4 q5 q6 q7 real
syms L1 L2 L3 L4 L5 L6 LL real
syms g real
syms beta1 beta2 beta3 beta4 beta5 beta6 beta7 beta8 beta9 beta10 real
syms beta11 beta12 beta13 beta14 beta15 beta16 beta17 beta18 beta19 beta20 real
syms beta21 beta22 beta23 beta24 beta25 beta26 beta27 beta28 beta29 beta30 real
syms beta31 beta32 beta33 beta34 beta35 beta36 beta37 beta38 beta39 beta40 real
syms beta41 beta42 beta43 beta44 beta45 beta46 beta47 beta48 real
% vel=0
q = [q1;q2;q3;q4;q5;q6;q7];
qd1 = sym(0);qd2 = sym(0);qd3 = sym(0);qd4 = sym(0);qd5 = sym(0);qd6 = sym(0);qd7 = sym(0);
% betax = 0
beta6=0;
beta12=0;
beta18=0;
beta24=0;
beta37=0;
beta43=0;
% DoF
DOF = 7;

%% def betaM betaG
beta_str    = {'beta1','beta2','beta3','beta4','beta5','beta7','beta8','beta9','beta10','beta11','beta13','beta14','beta15','beta16','beta17','beta19','beta20','beta21','beta22','beta23','beta25','beta26','beta27','beta28','beta29','beta30','beta31','beta32','beta33','beta34','beta35','beta36','beta38','beta39','beta40','beta41','beta42'};
betaG_str   = {'beta32','beta33','beta34','beta35','beta36','beta38','beta39','beta40','beta41','beta42'};
betaM_str   = {'beta1','beta2','beta3','beta4','beta5','beta7','beta8','beta9','beta10','beta11','beta13','beta14','beta15','beta16','beta17','beta19','beta20','beta21','beta22','beta23','beta25','beta26','beta27','beta28','beta29','beta30','beta31'};
beta    = [beta1,beta2,beta3,beta4,beta5,beta7,beta8,beta9,beta10,beta11,beta13,beta14,beta15,beta16,beta17,beta19,beta20,beta21,beta22,beta23,beta25,beta26,beta27,beta28,beta29,beta30,beta31,beta32,beta33,beta34,beta35,beta36,beta38,beta39,beta40,beta41,beta42];
betaG   = [beta32,beta33,beta34,beta35,beta36,beta38,beta39,beta40,beta41,beta42];
betaM   = [beta1,beta2,beta3,beta4,beta5,beta7,beta8,beta9,beta10,beta11,beta13,beta14,beta15,beta16,beta17,beta19,beta20,beta21,beta22,beta23,beta25,beta26,beta27,beta28,beta29,beta30,beta31];


%% obtain the regression of base parameter set
% regrouped paras
m1 = sym(0);m2 = sym(0);m3 = sym(0);m4 = sym(0);m5 = sym(0);m6 = sym(0);m7 = sym(0);
mz1 = sym(0);mz2 = sym(0);mz3 = sym(0);mz4 = sym(0);mz5 = sym(0);mz6 = sym(0);mz7 = sym(0);
I1yy = sym(0);I2yy = sym(0);I3yy = sym(0);I4yy = sym(0);I5yy = sym(0);I6yy = sym(0);I7yy = sym(0);
% independent paras
I1xx = sym(0);I1xy = sym(0);I1xz = sym(0);I1yz = sym(0);mx1 = sym(0);my1 = sym(0);
Ia1 = sym(0);Ia2 = sym(0);
% base parameter set
% XX
I2xx=beta1;I3xx=beta2;I4xx=beta3;I5xx=beta4;I6xx=beta5;I7xx=beta6;
% XY
I2xy=beta7;I3xy=beta8;I4xy=beta9;I5xy=beta10;I6xy=beta11;I7xy=beta12;
% XZ
I2xz=beta13;I3xz=beta14;I4xz=beta15;I5xz=beta16;I6xz=beta17;I7xz=beta18;
% YZ
I2yz=beta19;I3yz=beta20;I4yz=beta21;I5yz=beta22;I6yz=beta23;I7yz=beta24;
% ZZ
I1zz=beta25;I2zz=beta26;I3zz=beta27;I4zz=beta28;I5zz=beta29;I6zz=beta30;I7zz=beta31;
% MX
mx2=beta32;mx3=beta33;mx4=beta34;mx5=beta35;mx6=beta36;mx7=beta37;
% MY
my2=beta38;my3=beta39;my4=beta40;my5=beta41;my6=beta42;my7=beta43;
% IA
Ia3=sym(0);Ia4=sym(0);Ia5=sym(0);Ia6=sym(0);Ia7=sym(0);


%% M
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

%% G
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
WI12=-(qd1.*S2);
WI22=-(C2.*qd1);
WP12=qd2.*WI22;
WP22=-(qd2.*WI12);
DV112=-WI12.^2;
DV222=-WI22.^2;
DV332=-qd2.^2;
DV122=WI12.*WI22;
DV132=qd2.*WI12;
DV232=qd2.*WI22;
U132=DV132 + WP22;
U222=DV112 + DV332;
U232=DV232 - WP12;
U312=DV132 - WP22;
U322=DV232 + WP12;
VP12=g.*S2;
VP22=C2.*g;
PIS12=-I2yy + I2zz;
PIS22=I2xx - I2zz;
PIS32=-I2xx + I2yy;
No12=DV122.*I2xz + (-DV222 + DV332).*I2yz + DV232.*PIS12 - I2xy.*U312 + I2xx.*WP12;
No22=(DV112 - DV332).*I2xz - DV122.*I2yz + DV132.*PIS22 + I2xy.*U322 + I2yy.*WP22;
No32=(-DV112 + DV222).*I2xy + DV122.*PIS32 + I2yz.*U132 - I2xz.*U232;
WI13=qd2.*S3 + C3.*WI12;
WI23=C3.*qd2 - S3.*WI12;
W33=qd3 - WI22;
WP13=qd3.*WI23 + C3.*WP12;
WP23=-(qd3.*WI13) - S3.*WP12;
DV113=-WI13.^2;
DV223=-WI23.^2;
DV333=-W33.^2;
DV123=WI13.*WI23;
DV133=W33.*WI13;
DV233=W33.*WI23;
U113=DV223 + DV333;
U123=DV123 + WP22;
U133=DV133 + WP23;
U213=DV123 - WP22;
U223=DV113 + DV333;
U233=DV233 - WP13;
U313=DV133 - WP23;
U323=DV233 + WP13;
VSP13=-(DV122.*L5) + VP12;
VSP23=-(L5.*U222) + VP22;
VSP33=-(L5.*U322);
VP13=C3.*VSP13 + S3.*VSP33;
VP23=-(S3.*VSP13) + C3.*VSP33;
F13=mx3.*U113 + my3.*U123 + mz3.*U133 + m3.*VP13;
F23=mx3.*U213 + my3.*U223 + mz3.*U233 + m3.*VP23;
PIS13=-I3yy + I3zz;
PIS23=I3xx - I3zz;
PIS33=-I3xx + I3yy;
No13=(-DV223 + DV333).*I3yz + DV233.*PIS13 + I3xz.*U213 - I3xy.*U313 + I3xx.*WP13;
No23=(DV113 - DV333).*I3xz + DV133.*PIS23 - I3yz.*U123 + I3xy.*U323 + I3yy.*WP23;
No33=(-DV113 + DV223).*I3xy + DV123.*PIS33 + I3yz.*U133 - I3xz.*U233 - I3zz.*WP22;
WI14=S4.*W33 + C4.*WI13;
WI24=C4.*W33 - S4.*WI13;
W34=qd4 - WI23;
WP14=qd4.*WI24 + C4.*WP13 - S4.*WP22;
WP24=-(qd4.*WI14) - S4.*WP13 - C4.*WP22;
DV114=-WI14.^2;
DV224=-WI24.^2;
DV334=-W34.^2;
DV124=WI14.*WI24;
DV134=W34.*WI14;
DV234=W34.*WI24;
U114=DV224 + DV334;
U124=DV124 + WP23;
U134=DV134 + WP24;
U214=DV124 - WP23;
U224=DV114 + DV334;
U234=DV234 - WP14;
U314=DV134 - WP24;
U324=DV234 + WP14;
U334=DV114 + DV224;
VSP14=L1.*U113 + VP13;
VSP24=L1.*U213 + VP23;
VSP34=L1.*U313 - VSP23;
VP14=C4.*VSP14 + S4.*VSP34;
VP24=-(S4.*VSP14) + C4.*VSP34;
F14=mx4.*U114 + my4.*U124 + mz4.*U134 + m4.*VP14;
F24=mx4.*U214 + my4.*U224 + mz4.*U234 + m4.*VP24;
F34=mx4.*U314 + my4.*U324 + mz4.*U334 - m4.*VSP24;
PIS14=-I4yy + I4zz;
PIS24=I4xx - I4zz;
PIS34=-I4xx + I4yy;
No14=(-DV224 + DV334).*I4yz + DV234.*PIS14 + I4xz.*U214 - I4xy.*U314 + I4xx.*WP14;
No24=(DV114 - DV334).*I4xz + DV134.*PIS24 - I4yz.*U124 + I4xy.*U324 + I4yy.*WP24;
No34=(-DV114 + DV224).*I4xy + DV124.*PIS34 + I4yz.*U134 - I4xz.*U234 - I4zz.*WP23;
WI15=-(S5.*W34) + C5.*WI14;
WI25=-(C5.*W34) - S5.*WI14;
W35=qd5 + WI24;
WP15=qd5.*WI25 + C5.*WP14 + S5.*WP23;
WP25=-(qd5.*WI15) - S5.*WP14 + C5.*WP23;
DV115=-WI15.^2;
DV225=-WI25.^2;
DV335=-W35.^2;
DV125=WI15.*WI25;
DV135=W35.*WI15;
DV235=W35.*WI25;
U115=DV225 + DV335;
U125=DV125 - WP24;
U135=DV135 + WP25;
U215=DV125 + WP24;
U225=DV115 + DV335;
U235=DV235 - WP15;
U315=DV135 - WP25;
U325=DV235 + WP15;
U335=DV115 + DV225;
VSP15=L2.*U114 + L6.*U124 + VP14;
VSP25=L2.*U214 + L6.*U224 + VP24;
VSP35=L2.*U314 + L6.*U324 - VSP24;
VP15=C5.*VSP15 - S5.*VSP35;
VP25=-(S5.*VSP15) - C5.*VSP35;
F15=mx5.*U115 + my5.*U125 + mz5.*U135 + m5.*VP15;
F25=mx5.*U215 + my5.*U225 + mz5.*U235 + m5.*VP25;
F35=mx5.*U315 + my5.*U325 + mz5.*U335 + m5.*VSP25;
PIS15=-I5yy + I5zz;
PIS25=I5xx - I5zz;
PIS35=-I5xx + I5yy;
No15=(-DV225 + DV335).*I5yz + DV235.*PIS15 + I5xz.*U215 - I5xy.*U315 + I5xx.*WP15;
No25=(DV115 - DV335).*I5xz + DV135.*PIS25 - I5yz.*U125 + I5xy.*U325 + I5yy.*WP25;
No35=(-DV115 + DV225).*I5xy + DV125.*PIS35 + I5yz.*U135 - I5xz.*U235 + I5zz.*WP24;
WI16=S6.*W35 + C6.*WI15;
WI26=C6.*W35 - S6.*WI15;
W36=qd6 - WI25;
WP16=qd6.*WI26 + C6.*WP15 + S6.*WP24;
WP26=-(qd6.*WI16) - S6.*WP15 + C6.*WP24;
DV116=-WI16.^2;
DV226=-WI26.^2;
DV336=-W36.^2;
DV126=WI16.*WI26;
DV136=W36.*WI16;
DV236=W36.*WI26;
U116=DV226 + DV336;
U126=DV126 + WP25;
U136=DV136 + WP26;
U216=DV126 - WP25;
U226=DV116 + DV336;
U236=DV236 - WP16;
U316=DV136 - WP26;
U326=DV236 + WP16;
U336=DV116 + DV226;
VP16=C6.*VP15 + S6.*VSP25;
VP26=-(S6.*VP15) + C6.*VSP25;
F16=mx6.*U116 + my6.*U126 + mz6.*U136 + m6.*VP16;
F26=mx6.*U216 + my6.*U226 + mz6.*U236 + m6.*VP26;
F36=mx6.*U316 + my6.*U326 + mz6.*U336 - m6.*VP25;
PIS16=-I6yy + I6zz;
PIS26=I6xx - I6zz;
PIS36=-I6xx + I6yy;
No16=(-DV226 + DV336).*I6yz + DV236.*PIS16 + I6xz.*U216 - I6xy.*U316 + I6xx.*WP16;
No26=(DV116 - DV336).*I6xz + DV136.*PIS26 - I6yz.*U126 + I6xy.*U326 + I6yy.*WP26;
No36=(-DV116 + DV226).*I6xy + DV126.*PIS36 + I6yz.*U136 - I6xz.*U236 - I6zz.*WP25;
WI17=S7.*W36 + C7.*WI16;
WI27=C7.*W36 - S7.*WI16;
W37=qd7 - WI26;
WP17=qd7.*WI27 + C7.*WP16 - S7.*WP25;
WP27=-(qd7.*WI17) - S7.*WP16 - C7.*WP25;
DV117=-WI17.^2;
DV227=-WI27.^2;
DV337=-W37.^2;
DV127=WI17.*WI27;
DV137=W37.*WI17;
DV237=W37.*WI27;
U117=DV227 + DV337;
U127=DV127 + WP26;
U137=DV137 + WP27;
U217=DV127 - WP26;
U227=DV117 + DV337;
U237=DV237 - WP17;
U317=DV137 - WP27;
U327=DV237 + WP17;
U337=DV117 + DV227;
VSP17=L3.*U116 + VP16;
VSP27=L3.*U216 + VP26;
VSP37=L3.*U316 - VP25;
VP17=C7.*VSP17 + S7.*VSP37;
VP27=-(S7.*VSP17) + C7.*VSP37;
F17=mx7.*U117 + my7.*U127 + mz7.*U137 + m7.*VP17;
F27=mx7.*U217 + my7.*U227 + mz7.*U237 + m7.*VP27;
F37=mx7.*U317 + my7.*U327 + mz7.*U337 - m7.*VSP27;
PIS17=-I7yy + I7zz;
PIS27=I7xx - I7zz;
PIS37=-I7xx + I7yy;
No17=(-DV227 + DV337).*I7yz + DV237.*PIS17 + I7xz.*U217 - I7xy.*U317 + I7xx.*WP17;
No27=(DV117 - DV337).*I7xz + DV137.*PIS27 - I7yz.*U127 + I7xy.*U327 + I7yy.*WP27;
No37=(-DV117 + DV227).*I7xy + DV127.*PIS37 + I7yz.*U137 - I7xz.*U237 - I7zz.*WP26;
N17=No17 - mz7.*VP27 - my7.*VSP27;
N27=No27 + mz7.*VP17 + mx7.*VSP27;
N37=No37 - my7.*VP17 + mx7.*VP27;
FDI17=C7.*F17 - F27.*S7;
FDI37=C7.*F27 + F17.*S7;
E16=F16 + FDI17;
E26=F26 - F37;
E36=F36 + FDI37;
N16=C7.*N17 + No16 - N27.*S7 - my6.*VP25 - mz6.*VP26;
N26=-(FDI37.*L3) - N37 + No26 + mz6.*VP16 + mx6.*VP25;
N36=-(F37.*L3) + C7.*N27 + No36 + N17.*S7 - my6.*VP16 + mx6.*VP26;
FDI16=C6.*E16 - E26.*S6;
FDI36=C6.*E26 + E16.*S6;
E15=F15 + FDI16;
E25=-E36 + F25;
E35=F35 + FDI36;
N15=C6.*N16 + No15 - N26.*S6 - mz5.*VP25 + my5.*VSP25;
N25=-N36 + No25 + mz5.*VP15 - mx5.*VSP25;
N35=C6.*N26 + No35 + N16.*S6 - my5.*VP15 + mx5.*VP25;
FDI15=C5.*E15 - E25.*S5;
FDI35=-(C5.*E25) - E15.*S5;
E14=F14 + FDI15;
E24=E35 + F24;
E34=F34 + FDI35;
N14=FDI35.*L6 + C5.*N15 + No14 - N25.*S5 - mz4.*VP24 - my4.*VSP24;
N24=-(FDI35.*L2) + N35 + No24 + mz4.*VP14 + mx4.*VSP24;
N34=E35.*L2 - FDI15.*L6 - C5.*N25 + No34 - N15.*S5 - my4.*VP14 + mx4.*VP24;
FDI14=C4.*E14 - E24.*S4;
FDI34=C4.*E24 + E14.*S4;
E13=F13 + FDI14;
E23=-E34 + F23;
N13=C4.*N14 + No13 - N24.*S4 - mz3.*VP23 - my3.*VSP23;
N23=-(FDI34.*L1) - N34 + No23 + mz3.*VP13 + mx3.*VSP23;
N33=-(E34.*L1) + C4.*N24 + No33 + N14.*S4 - my3.*VP13 + mx3.*VP23;
FDI13=C3.*E13 - E23.*S3;
FDI33=C3.*E23 + E13.*S3;
N12=-(FDI33.*L5) + C3.*N13 + No12 - N23.*S3 - mz2.*VP22;
N22=-N33 + No22 + mz2.*VP12;
N32=FDI13.*L5 + C3.*N23 + No32 + N13.*S3 - my2.*VP12 + mx2.*VP22;
N31=-(C2.*N22) - N12.*S2;
H1=N31;
H2=N32;
H3=N33;
H4=N34;
H5=N35;
H6=N36;
H7=N37;



%% get simplified M
tic
M(1,1)=simplify(A(1,1));
toc
tic
M(2,1)=simplify(A(2,1));
toc
tic
M(3,1)=simplify(A(3,1));
M(4,1)=simplify(A(4,1));
M(5,1)=simplify(A(5,1));
M(6,1)=simplify(A(6,1));
M(7,1)=simplify(A(7,1));
toc
tic
M(2,2)=simplify(A(2,2));
toc
tic
M(3,2)=simplify(A(3,2));
M(4,2)=simplify(A(4,2));
M(5,2)=simplify(A(5,2));
M(6,2)=simplify(A(6,2));
M(7,2)=simplify(A(7,2));
toc
tics
M(3,3)=simplify(A(3,3));
M(4,3)=simplify(A(4,3));
M(5,3)=simplify(A(5,3));
M(6,3)=simplify(A(6,3));
M(7,3)=simplify(A(7,3));
M(4,4)=simplify(A(4,4));
M(5,4)=simplify(A(5,4));
M(6,4)=simplify(A(6,4));
M(7,4)=simplify(A(7,4));
M(5,5)=simplify(A(5,5));
M(6,5)=simplify(A(6,5));
M(7,5)=simplify(A(7,5));
M(6,6)=simplify(A(6,6));
M(7,6)=simplify(A(7,6));
M(7,7)=simplify(A(7,7));
toc
M(1,1)=M(1,1);
M(1,2)=M(2,1);
M(1,3)=M(3,1);
M(1,4)=M(4,1);
M(1,5)=M(5,1);
M(1,6)=M(6,1);
M(1,7)=M(7,1);
M(2,2)=M(2,2);
M(2,3)=M(3,2);
M(2,4)=M(4,2);
M(2,5)=M(5,2);
M(2,6)=M(6,2);
M(2,7)=M(7,2);
M(3,3)=M(3,3);
M(3,4)=M(4,3);
M(3,5)=M(5,3);
M(3,6)=M(6,3);
M(3,7)=M(7,3);
M(4,4)=M(4,4);
M(4,5)=M(5,4);
M(4,6)=M(6,4);
M(4,7)=M(7,4);
M(5,5)=M(5,5);
M(5,6)=M(6,5);
M(5,7)=M(7,5);
M(6,6)=M(6,6);
M(6,7)=M(7,6);

 
%% get simplified C: Using Christoffel Symbol
tic
syms dq1 dq2 dq3 dq4 dq5 dq6 dq7 real
syms ddq1 ddq2 ddq3 ddq4 ddq5 ddq6 ddq7 real
dq = [dq1;dq2;dq3;dq4;dq5;dq6;dq7];
ddq = [ddq1;ddq2;ddq3;ddq4;ddq5;ddq6;ddq7];
CS = sym(zeros(DOF,DOF,DOF));
for k = 1:DOF
	for j = 1:DOF
		for i = 1:j
			CS(i,j,k) = diff(M(k,j),q(i))+diff(M(k,i),q(j))-diff(M(i,j),q(k));
			CS(i,j,k) = CS(i,j,k)/sym(2);
			CS(j,i,k) = CS(i,j,k);
		end
	end
end
C = sym(zeros(DOF,DOF));
for k = 1:DOF
	for j = 1:DOF
		for i = 1:DOF
			C(k,j) = C(k,j)+CS(i,j,k)*dq(i);
		end
	end
end
toc
 

%% get simplified G and G_g : to identify betaG
tic
G(1)=simplify(H1);
G(2)=simplify(H2);
G(3)=simplify(H3);
G(4)=simplify(H4);
G(5)=simplify(H5);
G(6)=simplify(H6);
G(7)=simplify(H7);
G = collect(G,betaG);
toc
G1=G(1)
G2=G(2)
G3=G(3)
G4=G(4)
G5=G(5)
G6=G(6)
G7=G(7)


%% get tau related to MC: to identify betaM
tau_MC = M*ddq+C*dq;
tau_MC = collect(tau_MC,beta_str);

%% extract the regressors of MC
len_betaM = length(betaM_str);
Y_M = sym(zeros(DOF,len_betaM));
len_betaG = length(betaG_str);
Y_G = sym(zeros(DOF,len_betaG));
for i = 1:DOF
    Y_M(i,:) = get_regressor(tau_MC(i),beta_str,betaM_str);
    Y_G(i,:) = get_regressor(tau_MC(i),beta_str,betaG_str);
end
simplify(tau_MC-Y_M*betaM'-Y_G*betaG')

% show Y
Y_M_show = zeros(DOF,len_betaM);
for i = 1:DOF
    for j = 1:len_betaM
        if(~isequal(Y_M(i,j),sym(0)))
            Y_M_show(i,j) = 1;
        end
    end
end
Y_M_show
save save_franka_dyn.mat
