%% 计算生成getY.mat函数

%% syms def
clear;clc;
syms q1 q2 q3 q4 q5 q6 real
syms qd1 qd2 qd3 qd4 qd5 qd6 real
syms qdd1 qdd2 qdd3 qdd4 qdd5 qdd6 real
syms L1 L2 L3 L4 L5 L6 real
syms g real
syms beta1 beta2 beta3 beta4 beta5 beta6 beta7 beta8 beta9 beta10 real
syms beta11 beta12 beta13 beta14 beta15 beta16 beta17 beta18 beta19 beta20 real
syms beta21 beta22 beta23 beta24 beta25 beta26 beta27 beta28 beta29 beta30 real
syms beta31 beta32 beta33 beta34 beta35 beta36 beta37 beta38 beta39 beta40 real

q = [q1;q2;q3;q4;q5;q6];
qd = [qd1;qd2;qd3;qd4;qd5;qd6];
qdd = [qdd1;qdd2;qdd3;qdd4;qdd5;qdd6];

% DoF
DOF = 6;

%% def beta
beta_str    = {'beta1','beta2','beta3','beta4','beta5','beta6','beta7','beta8','beta9','beta10','beta11','beta12','beta13','beta14','beta15','beta16','beta17','beta18','beta19','beta20','beta21','beta22','beta23','beta24','beta25','beta26','beta27','beta28','beta29','beta30','beta31','beta32','beta33','beta34','beta35','beta36','beta37','beta38','beta39','beta40'};
beta    = [beta1,beta2,beta3,beta4,beta5,beta6,beta7,beta8,beta9,beta10,beta11,beta12,beta13,beta14,beta15,beta16,beta17,beta18,beta19,beta20,beta21,beta22,beta23,beta24,beta25,beta26,beta27,beta28,beta29,beta30,beta31,beta32,beta33,beta34,beta35,beta36,beta37,beta38,beta39,beta40];

%% obtain the regression of base parameter set
% regrouped paras
m1 = sym(0);m2 = sym(0);m3 = sym(0);m4 = sym(0);m5 = sym(0);m6 = sym(0);
mz1 = sym(0);mz2 = sym(0);mz3 = sym(0);mz4 = sym(0);mz5 = sym(0);mz6 = sym(0);
I1yy = sym(0);I2yy = sym(0);I3yy = sym(0);I4yy = sym(0);I5yy = sym(0);I6yy = sym(0);
% independent paras
I1xx = sym(0);I1xy = sym(0);I1xz = sym(0);I1yz = sym(0);mx1 = sym(0);my1 = sym(0);
Ia1 = sym(0);Ia2 = sym(0);
% base parameter set
% XX
I2xx=beta1;I3xx=beta2;I4xx=beta3;I5xx=beta4;I6xx=beta5;
% XY
I2xy=beta6;I3xy=beta7;I4xy=beta8;I5xy=beta9;I6xy=beta10;
% XZ
I2xz=beta11;I3xz=beta12;I4xz=beta13;I5xz=beta14;I6xz=beta15;
% YZ
I2yz=beta16;I3yz=beta17;I4yz=beta18;I5yz=beta19;I6yz=beta20;
% ZZ
I1zz=beta21;I2zz=beta22;I3zz=beta23;I4zz=beta24;I5zz=beta25;I6zz=beta26;
% MX
mx2=beta27;mx3=beta28;mx4=beta29;mx5=beta30;mx6=beta31;
% MY
my2=beta32;my3=beta33;my4=beta34;my5=beta35;my6=beta36;
% IA
Ia3=beta37;Ia4=beta38;Ia5=beta39;Ia6=beta40;


%% M
S1=sin(q1);
C1=cos(q1);
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
AS16=C6.*mx6 - my6.*S6;
AS36=-(C6.*my6) - mx6.*S6;
AJ116=C6.*I6xx - I6xy.*S6;
AJ126=C6.*I6xy - I6yy.*S6;
AJ136=C6.*I6xz - I6yz.*S6;
AJ316=-(C6.*I6xy) - I6xx.*S6;
AJ326=-(C6.*I6yy) - I6xy.*S6;
AJ336=-(C6.*I6yz) - I6xz.*S6;
AJA116=AJ116.*C6 - AJ126.*S6;
AJA216=C6.*I6xz - I6yz.*S6;
AJA316=AJ316.*C6 - AJ326.*S6;
AJA336=-(AJ326.*C6) - AJ316.*S6;
XXP5=AJA116 + I5xx;
XYP5=AJA216 + I5xy;
XZP5=AJA316 + I5xz;
YYP5=I5yy + I6zz;
YZP5=AJ336 + I5yz;
ZZP5=AJA336 + I5zz;
MXP5=AS16 + mx5;
MYP5=my5 + mz6;
MZP5=AS36 + mz5;
MP5=m5 + m6;
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
MZP2=mz2 + MZP3;
MP2=m2 + MP3;
AS12=C2.*MXP2 - MYP2.*S2;
AS32=-(C2.*MYP2) - MXP2.*S2;
AJ112=-((AJA213 + I2xy - PAS213).*S2) + C2.*XXP2;
AJ122=C2.*XYP2 - S2.*YYP2;
AJ132=C2.*XZP2 - S2.*YZP2;
AJ212=AJA313 + I2xz - PAS313;
AJ222=AJA323 + I2yz;
AJ312=-(C2.*(AJA213 + I2xy - PAS213)) - S2.*XXP2;
AJ322=-(S2.*XYP2) - C2.*YYP2;
AJ332=-(S2.*XZP2) - C2.*YZP2;
AJA112=AJ112.*C2 - AJ122.*S2;
AJA212=AJ212.*C2 - AJ222.*S2;
AJA312=AJ312.*C2 - AJ322.*S2;
AJA332=-(AJ322.*C2) - AJ312.*S2;
PAS212=L1.*MZP2;
PAS222=-(AS12.*L1);
PAS312=AS32.*L1;
PAS332=-(AS12.*L1);
XXP1=AJA112 + I1xx;
XYP1=AJA212 + I1xy - PAS212;
XZP1=AJA312 + I1xz - PAS312;
YYP1=I1yy + L1.^2.*MP2 - 2.*PAS222 + ZZP2;
YZP1=AJ332 + I1yz;
ZZP1=AJA332 + I1zz + L1.^2.*MP2 - 2.*PAS332;
MXP1=AS12 + L1.*MP2 + mx1;
MYP1=my1 + MZP2;
MZP1=AS32 + mz1;
MP1=m1 + MP2;
EB12=-(C2.*MYP2) - MXP2.*S2;
EB32=-(C2.*MXP2) + MYP2.*S2;
NB22=-(EB32.*L1) + ZZP2;
EC12=-(C3.*MYP3) - MXP3.*S3;
EC22=C3.*MXP3 - MYP3.*S3;
NC32=EC22.*L3 + ZZP3;
EC13=C2.*EC12 - EC22.*S2;
EC33=-(C2.*EC22) - EC12.*S2;
NC13=AJ133.*C2 - AJ233.*S2;
NC23=-(EC33.*L1) + NC32;
NC33=-(AJ233.*C2) - AJ133.*S2;
ED12=-(C4.*MYP4) - MXP4.*S4;
ED32=-(C4.*MXP4) + MYP4.*S4;
ND12=AJ134 + ED32.*L5;
ND22=-(ED32.*L4) + ZZP4;
ND32=AJ334 - ED12.*L5;
ED13=C3.*ED12;
ED23=ED12.*S3;
ND13=C3.*ND12 - ND22.*S3;
ND23=-(ED32.*L3) + C3.*ND22 + ND12.*S3;
ND33=ED23.*L3 + ND32;
ED14=C2.*ED13 - ED23.*S2;
ED34=-(C2.*ED23) - ED13.*S2;
ND14=C2.*ND13 - ND23.*S2;
ND24=-(ED34.*L1) + ND33;
ND34=ED32.*L1 - C2.*ND23 - ND13.*S2;
EE12=-(C5.*MYP5) - MXP5.*S5;
EE32=C5.*MXP5 - MYP5.*S5;
EE13=C4.*EE12;
EE33=-(EE12.*S4);
NE13=AJ135.*C4 + EE33.*L5 + S4.*ZZP5;
NE23=AJ335 - EE33.*L4;
NE33=EE32.*L4 - EE13.*L5 - AJ135.*S4 + C4.*ZZP5;
EE14=C3.*EE13 - EE32.*S3;
EE24=C3.*EE32 + EE13.*S3;
NE14=C3.*NE13 - NE23.*S3;
NE24=-(EE33.*L3) + C3.*NE23 + NE13.*S3;
NE34=EE24.*L3 + NE33;
EE15=C2.*EE14 - EE24.*S2;
EE35=-(C2.*EE24) - EE14.*S2;
NE15=C2.*NE14 - NE24.*S2;
NE25=-(EE35.*L1) + NE34;
NE35=EE33.*L1 - C2.*NE24 - NE14.*S2;
EF12=-(C6.*my6) - mx6.*S6;
EF32=-(C6.*mx6) + my6.*S6;
EF13=C5.*EF12;
EF33=EF12.*S5;
NF13=AJ136.*C5 - I6zz.*S5;
NF33=C5.*I6zz + AJ136.*S5;
EF14=C4.*EF13 + EF32.*S4;
EF34=C4.*EF32 - EF13.*S4;
NF14=EF34.*L5 + C4.*NF13 + AJ336.*S4;
NF24=-(EF34.*L4) + NF33;
NF34=AJ336.*C4 + EF33.*L4 - EF14.*L5 - NF13.*S4;
EF15=C3.*EF14 - EF33.*S3;
EF25=C3.*EF33 + EF14.*S3;
NF15=C3.*NF14 - NF24.*S3;
NF25=-(EF34.*L3) + C3.*NF24 + NF14.*S3;
NF35=EF25.*L3 + NF34;
EF16=C2.*EF15 - EF25.*S2;
EF36=-(C2.*EF25) - EF15.*S2;
NF16=C2.*NF15 - NF25.*S2;
NF26=-(EF36.*L1) + NF35;
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
A(6,6)=I6zz + Ia6;

%% CG
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
DV331=-qd1.^2;
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
U112=DV222 + DV332;
U132=DV132 + WP22;
U232=DV232 - WP12;
U312=DV132 - WP22;
U322=DV232 + WP12;
U332=DV112 + DV222;
VSP12=DV331.*L1;
VP12=g.*S2 + C2.*VSP12;
VP22=C2.*g - S2.*VSP12;
F32=mx2.*U312 + my2.*U322 + mz2.*U332;
PIS12=-I2yy + I2zz;
PIS22=I2xx - I2zz;
PIS32=-I2xx + I2yy;
No12=DV122.*I2xz + (-DV222 + DV332).*I2yz + DV232.*PIS12 - I2xy.*U312 + I2xx.*WP12;
No22=(DV112 - DV332).*I2xz - DV122.*I2yz + DV132.*PIS22 + I2xy.*U322 + I2yy.*WP22;
No32=(-DV112 + DV222).*I2xy + DV122.*PIS32 + I2yz.*U132 - I2xz.*U232;
WI13=C3.*WI12 + S3.*WI22;
WI23=-(S3.*WI12) + C3.*WI22;
W33=qd2 + qd3;
WP13=qd3.*WI23 + C3.*WP12 + S3.*WP22;
WP23=-(qd3.*WI13) - S3.*WP12 + C3.*WP22;
DV113=-WI13.^2;
DV223=-WI23.^2;
DV333=-W33.^2;
DV123=WI13.*WI23;
DV133=W33.*WI13;
DV233=W33.*WI23;
U113=DV223 + DV333;
U133=DV133 + WP23;
U223=DV113 + DV333;
U233=DV233 - WP13;
U313=DV133 - WP23;
U323=DV233 + WP13;
U333=DV113 + DV223;
VSP13=L3.*U112 + VP12;
VSP23=DV122.*L3 + VP22;
VSP33=L3.*U312;
VP13=C3.*VSP13 + S3.*VSP23;
VP23=-(S3.*VSP13) + C3.*VSP23;
F13=DV123.*my3 + mx3.*U113 + mz3.*U133 + m3.*VP13;
F23=DV123.*mx3 + my3.*U223 + mz3.*U233 + m3.*VP23;
F33=mx3.*U313 + my3.*U323 + mz3.*U333 + m3.*VSP33;
PIS13=-I3yy + I3zz;
PIS23=I3xx - I3zz;
PIS33=-I3xx + I3yy;
No13=DV123.*I3xz + (-DV223 + DV333).*I3yz + DV233.*PIS13 - I3xy.*U313 + I3xx.*WP13;
No23=(DV113 - DV333).*I3xz - DV123.*I3yz + DV133.*PIS23 + I3xy.*U323 + I3yy.*WP23;
No33=(-DV113 + DV223).*I3xy + DV123.*PIS33 + I3yz.*U133 - I3xz.*U233;
WI14=-(S4.*W33) + C4.*WI13;
WI24=-(C4.*W33) - S4.*WI13;
W34=qd4 + WI23;
WP14=qd4.*WI24 + C4.*WP13;
WP24=-(qd4.*WI14) - S4.*WP13;
DV114=-WI14.^2;
DV224=-WI24.^2;
DV334=-W34.^2;
DV124=WI14.*WI24;
DV134=W34.*WI14;
DV234=W34.*WI24;
U114=DV224 + DV334;
U124=DV124 - WP23;
U134=DV134 + WP24;
U214=DV124 + WP23;
U224=DV114 + DV334;
U234=DV234 - WP14;
U314=DV134 - WP24;
U324=DV234 + WP14;
U334=DV114 + DV224;
VSP14=DV123.*L5 + L4.*U113 + VP13;
VSP24=DV123.*L4 + L5.*U223 + VP23;
VSP34=L4.*U313 + L5.*U323 + VSP33;
VP14=C4.*VSP14 - S4.*VSP34;
VP24=-(S4.*VSP14) - C4.*VSP34;
F14=mx4.*U114 + my4.*U124 + mz4.*U134 + m4.*VP14;
F24=mx4.*U214 + my4.*U224 + mz4.*U234 + m4.*VP24;
F34=mx4.*U314 + my4.*U324 + mz4.*U334 + m4.*VSP24;
PIS14=-I4yy + I4zz;
PIS24=I4xx - I4zz;
PIS34=-I4xx + I4yy;
No14=(-DV224 + DV334).*I4yz + DV234.*PIS14 + I4xz.*U214 - I4xy.*U314 + I4xx.*WP14;
No24=(DV114 - DV334).*I4xz + DV134.*PIS24 - I4yz.*U124 + I4xy.*U324 + I4yy.*WP24;
No34=(-DV114 + DV224).*I4xy + DV124.*PIS34 + I4yz.*U134 - I4xz.*U234 + I4zz.*WP23;
WI15=S5.*W34 + C5.*WI14;
WI25=C5.*W34 - S5.*WI14;
W35=qd5 - WI24;
WP15=qd5.*WI25 + C5.*WP14 + S5.*WP23;
WP25=-(qd5.*WI15) - S5.*WP14 + C5.*WP23;
DV115=-WI15.^2;
DV225=-WI25.^2;
DV335=-W35.^2;
DV125=WI15.*WI25;
DV135=W35.*WI15;
DV235=W35.*WI25;
U115=DV225 + DV335;
U125=DV125 + WP24;
U135=DV135 + WP25;
U215=DV125 - WP24;
U225=DV115 + DV335;
U235=DV235 - WP15;
U315=DV135 - WP25;
U325=DV235 + WP15;
U335=DV115 + DV225;
VP15=C5.*VP14 + S5.*VSP24;
VP25=-(S5.*VP14) + C5.*VSP24;
F15=mx5.*U115 + my5.*U125 + mz5.*U135 + m5.*VP15;
F25=mx5.*U215 + my5.*U225 + mz5.*U235 + m5.*VP25;
F35=mx5.*U315 + my5.*U325 + mz5.*U335 - m5.*VP24;
PIS15=-I5yy + I5zz;
PIS25=I5xx - I5zz;
PIS35=-I5xx + I5yy;
No15=(-DV225 + DV335).*I5yz + DV235.*PIS15 + I5xz.*U215 - I5xy.*U315 + I5xx.*WP15;
No25=(DV115 - DV335).*I5xz + DV135.*PIS25 - I5yz.*U125 + I5xy.*U325 + I5yy.*WP25;
No35=(-DV115 + DV225).*I5xy + DV125.*PIS35 + I5yz.*U135 - I5xz.*U235 - I5zz.*WP24;
WI16=-(S6.*W35) + C6.*WI15;
WI26=-(C6.*W35) - S6.*WI15;
W36=qd6 + WI25;
WP16=qd6.*WI26 + C6.*WP15 + S6.*WP24;
WP26=-(qd6.*WI16) - S6.*WP15 + C6.*WP24;
DV116=-WI16.^2;
DV226=-WI26.^2;
DV336=-W36.^2;
DV126=WI16.*WI26;
DV136=W36.*WI16;
DV236=W36.*WI26;
U116=DV226 + DV336;
U126=DV126 - WP25;
U136=DV136 + WP26;
U216=DV126 + WP25;
U226=DV116 + DV336;
U236=DV236 - WP16;
U316=DV136 - WP26;
U326=DV236 + WP16;
U336=DV116 + DV226;
VP16=C6.*VP15 + S6.*VP24;
VP26=-(S6.*VP15) + C6.*VP24;
F16=mx6.*U116 + my6.*U126 + mz6.*U136 + m6.*VP16;
F26=mx6.*U216 + my6.*U226 + mz6.*U236 + m6.*VP26;
F36=mx6.*U316 + my6.*U326 + mz6.*U336 + m6.*VP25;
PIS16=-I6yy + I6zz;
PIS26=I6xx - I6zz;
PIS36=-I6xx + I6yy;
No16=(-DV226 + DV336).*I6yz + DV236.*PIS16 + I6xz.*U216 - I6xy.*U316 + I6xx.*WP16;
No26=(DV116 - DV336).*I6xz + DV136.*PIS26 - I6yz.*U126 + I6xy.*U326 + I6yy.*WP26;
No36=(-DV116 + DV226).*I6xy + DV126.*PIS36 + I6yz.*U136 - I6xz.*U236 + I6zz.*WP25;
N16=No16 + my6.*VP25 - mz6.*VP26;
N26=No26 + mz6.*VP16 - mx6.*VP25;
N36=No36 - my6.*VP16 + mx6.*VP26;
FDI16=C6.*F16 - F26.*S6;
FDI36=-(C6.*F26) - F16.*S6;
E15=F15 + FDI16;
E25=F25 + F36;
E35=F35 + FDI36;
N15=C6.*N16 + No15 - N26.*S6 - my5.*VP24 - mz5.*VP25;
N25=N36 + No25 + mz5.*VP15 + mx5.*VP24;
N35=-(C6.*N26) + No35 - N16.*S6 - my5.*VP15 + mx5.*VP25;
FDI15=C5.*E15 - E25.*S5;
FDI35=C5.*E25 + E15.*S5;
E14=F14 + FDI15;
E24=-E35 + F24;
E34=F34 + FDI35;
N14=C5.*N15 + No14 - N25.*S5 - mz4.*VP24 + my4.*VSP24;
N24=-N35 + No24 + mz4.*VP14 - mx4.*VSP24;
N34=C5.*N25 + No34 + N15.*S5 - my4.*VP14 + mx4.*VP24;
FDI14=C4.*E14 - E24.*S4;
FDI34=-(C4.*E24) - E14.*S4;
E13=F13 + FDI14;
E23=E34 + F23;
E33=F33 + FDI34;
N13=FDI34.*L5 + C4.*N14 + No13 - N24.*S4 - mz3.*VP23 + my3.*VSP33;
N23=-(FDI34.*L4) + N34 + No23 + mz3.*VP13 - mx3.*VSP33;
N33=E34.*L4 - FDI14.*L5 - C4.*N24 + No33 - N14.*S4 - my3.*VP13 + mx3.*VP23;
FDI23=C3.*E23 + E13.*S3;
E32=E33 + F32;
N12=C3.*N13 + No12 - N23.*S3 - mz2.*VP22;
N22=-(E33.*L3) + C3.*N23 + No22 + N13.*S3 + mz2.*VP12;
N32=FDI23.*L3 + N33 + No32 - my2.*VP12 + mx2.*VP22;
N31=E32.*L1 - C2.*N22 - N12.*S2;
H1=N31;
H2=N32;
H3=N33;
H4=N34;
H5=N35;
H6=N36;



%% get simplified M
tic
M(1,1)=(A(1,1));
M(2,1)=(A(2,1));
M(3,1)=(A(3,1));
M(4,1)=(A(4,1));
M(5,1)=(A(5,1));
M(6,1)=(A(6,1));
M(2,2)=(A(2,2));
M(3,2)=(A(3,2));
M(4,2)=(A(4,2));
M(5,2)=(A(5,2));
M(6,2)=(A(6,2));
M(3,3)=(A(3,3));
M(4,3)=(A(4,3));
M(5,3)=(A(5,3));
M(6,3)=(A(6,3));
M(4,4)=(A(4,4));
M(5,4)=(A(5,4));
M(6,4)=(A(6,4));
M(5,5)=(A(5,5));
M(6,5)=(A(6,5));
M(6,6)=(A(6,6));
toc
M11=M(1,1)
M21=M(2,1)
M31=M(3,1)
M41=M(4,1)
M51=M(5,1)
M61=M(6,1)
M22=M(2,2)
M32=M(3,2)
M42=M(4,2)
M52=M(5,2)
M62=M(6,2)
M33=M(3,3)
M43=M(4,3)
M53=M(5,3)
M63=M(6,3)
M44=M(4,4)
M54=M(5,4)
M64=M(6,4)
M55=M(5,5)
M65=M(6,5)
M66=M(6,6)

M12 = M21;
M13 = M31;
M14 = M41;
M15 = M51;
M16 = M61;
M23 = M32;
M24 = M42;
M25 = M52;
M26 = M62;
M34 = M43;
M35 = M53;
M36 = M63;
M45 = M54;
M46 = M64;
M56 = M65;
M = [[M11, M12, M13, M14, M15, M16]; 
     [M21, M22, M23, M24, M25, M26]; 
     [M31, M32, M33, M34, M35, M36]; 
     [M41, M42, M43, M44, M45, M46]; 
     [M51, M52, M53, M54, M55, M56]; 
     [M61, M62, M63, M64, M65, M66]];
 
%% get simplified C: Using Christoffel Symbol
dq = [qd1;qd2;qd3;qd4;qd5;qd6];
ddq = [qdd1;qdd2;qdd3;qdd4;qdd5;qdd6];

%% get simplified G and G_g : to identify betaG
tic
cg(1)=(H1);
cg(2)=(H2);
cg(3)=(H3);
cg(4)=(H4);
cg(5)=(H5);
cg(6)=(H6);
toc



%% 新加：tau=Y(q,q_dot,q_ddot)beta
tic
tau = M*ddq+cg';
tau = collect(tau,beta_str);
% extract the regressors of tau
len_beta = length(beta_str);
Y = sym(zeros(DOF,len_beta));
for i = 1:DOF
    Y(i,:) = (get_regressor(tau(i),beta_str,beta_str));
end
simplify(tau-Y*beta')
toc

% show Y
Y_show = zeros(DOF,len_beta);
for i = 1:DOF
    for j = 1:len_beta
        if(~isequal(Y(i,j),sym(0)))
            Y_show(i,j) = 1;
        end
    end
end
Y_show
racer3_getY = matlabFunction(Y)
save racer3_getY.mat racer3_getY
