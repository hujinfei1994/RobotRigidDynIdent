/* (********************************************) */
/* (** SYMORO+ : SYmbolic MOdelling of RObots **) */
/* (**========================================**) */
/* (**      IRCCyN-ECN - 1, rue de la Noe     **) */
/* (**      B.P.92101                         **) */
/* (**      44321 Nantes cedex 3, FRANCE      **) */
/* (**      www.irccyn.ec-nantes.fr           **) */
/* (********************************************) */


/*    Name of file : C:/Users/73183/Desktop/SYMORO_WS/flexiv/flexiv_noload.dyn */




/*      Geometric parameters    */


/* j       ant     mu      sigma   gamma   b       alpha   d       theta   r */


/* 1       0       1       0       0       0       0       0       q1      L1 */

/*                                                 Pi */
/* 2       1       1       0       0       0       --      0       q2      0 */
/*                                                 2 */
/*                                                 -Pi */
/* 3       2       1       0       0       0       ---     0       q3      L2 */
/*                                                  2 */
/*                                                 -Pi */
/* 4       3       1       0       0       0       ---     L5      q4      0 */
/*                                                  2 */
/*                                                 Pi */
/* 5       4       1       0       0       0       --      -L5     q5      L3 */
/*                                                 2 */
/*                                                 Pi              Pi */
/* 6       5       1       0       0       0       --      0       -- + q6 0 */
/*                                                 2               2 */
/*                                                 Pi */
/* 7       6       1       0       0       0       --      L4      q7      0 */
/*                                                 2 */



/*              Inertial parameters */

/* j      XX     XY     XZ     YY     YZ     ZZ     MX     MY     MZ     M      Ia */

/* 1      I1xx   I1xy   I1xz   I1yy   I1yz   I1zz   mx1    my1    mz1    m1     Ia1 */

/* 2      I2xx   I2xy   I2xz   I2yy   I2yz   I2zz   mx2    my2    mz2    m2     Ia2 */

/* 3      I3xx   I3xy   I3xz   I3yy   I3yz   I3zz   mx3    my3    mz3    m3     Ia3 */

/* 4      I4xx   I4xy   I4xz   I4yy   I4yz   I4zz   mx4    my4    mz4    m4     Ia4 */

/* 5      I5xx   I5xy   I5xz   I5yy   I5yz   I5zz   mx5    my5    mz5    m5     Ia5 */

/* 6      I6xx   I6xy   I6xz   I6yy   I6yz   I6zz   mx6    my6    mz6    m6     Ia6 */

/* 7      I7xx   I7xy   I7xz   I7yy   I7yz   I7zz   mx7    my7    mz7    m7     Ia7 */



/*  External forces,friction parameters, joint velocities and accelerations */

/* j      FX     FY     FZ     CX     CY     CZ     FS     FV     QP     QDP */

/* 1      0      0      0      0      0      0      Fc1    Fv1    qd1    qdd1 */

/* 2      0      0      0      0      0      0      Fc2    Fv2    qd2    qdd2 */

/* 3      0      0      0      0      0      0      Fc3    Fv3    qd3    qdd3 */

/* 4      0      0      0      0      0      0      Fc4    Fv4    qd4    qdd4 */

/* 5      0      0      0      0      0      0      Fc5    Fv5    qd5    qdd5 */

/* 6      0      0      0      0      0      0      Fc6    Fv6    qd6    qdd6 */

/* 7      0      0      0      0      0      0      Fc7    Fv7    qd7    qdd7 */

/* Base velocity, base accelerations, and gravity */

/* j     W0    WP0   V0    VP0   G */

/* 1     0     0     0     0     0 */

/* 2     0     0     0     0     0 */

/* 3     0     0     0     0     g */

/*  Dynamic model: Newton Euler method */
/* Equations: */

#include <stdio.h>
#include <math.h>

#define sign(x) (x<0.0 ? -1.0 : (x==0.0 ? 0.0 : 1.0))

/* Declaration of global input variables */
extern double q2, q3, q4, q5, q6, q7, I1zz, qdd1, qd1, qd2;
extern double qdd2, g, I2yy, I2zz, I2xx, I2yz, I2xz, I2xy, qd3, qdd3;
extern double L2, mx3, my3, mz3, m3, I3yy, I3zz, I3xx, I3yz, I3xz;
extern double I3xy, qd4, qdd4, L5, mx4, my4, mz4, m4, I4yy, I4zz;
extern double I4xx, I4yz, I4xz, I4xy, qd5, qdd5, L3, mx5, my5, mz5;
extern double m5, I5yy, I5zz, I5xx, I5yz, I5xz, I5xy, qd6, qdd6, mx6;
extern double my6, mz6, m6, I6yy, I6zz, I6xx, I6yz, I6xz, I6xy, qd7;
extern double qdd7, L4, mx7, my7, mz7, m7, I7yy, I7zz, I7xx, I7yz;
extern double I7xz, I7xy, mz2, my2, mx2, Fv1, Ia1, Fc1, Fv2, Ia2;
extern double Fc2, Fv3, Ia3, Fc3, Fv4, Ia4, Fc4, Fv5, Ia5, Fc5;
extern double Fv6, Ia6, Fc6, Fv7, Ia7, Fc7;

/* Declaration of global output variables */
extern double GAM1, GAM2, GAM3, GAM4, GAM5, GAM6, GAM7;

/* Declaration of the function */
void flexiv_noload_dyn()
{
double S2, C2, S3, C3, S4, C4, S5, C5, S6, C6;
double S7, C7, No31, WI12, WI22, WP12, WP22, DV112, DV222, DV332;
double DV122, DV132, DV232, U122, U132, U212, U222, U232, U312, U322;
double VP12, VP22, PIS12, PIS22, PIS32, No12, No22, No32, WI13, WI23;
double W33, WP13, WP23, WP33, DV113, DV223, DV333, DV123, DV133, DV233;
double U113, U123, U133, U213, U223, U233, U313, U323, VSP13, VSP23;
double VSP33, VP13, VP23, F13, F23, PIS13, PIS23, PIS33, No13, No23;
double No33, WI14, WI24, W34, WP14, WP24, WP34, DV114, DV224, DV334;
double DV124, DV134, DV234, U114, U124, U134, U214, U224, U234, U314;
double U324, U334, VSP14, VSP24, VSP34, VP14, VP24, F14, F24, F34;
double PIS14, PIS24, PIS34, No14, No24, No34, WI15, WI25, W35, WP15;
double WP25, WP35, DV115, DV225, DV335, DV125, DV135, DV235, U115, U125;
double U135, U215, U225, U235, U315, U325, U335, VSP15, VSP25, VSP35;
double VP15, VP25, F15, F25, F35, PIS15, PIS25, PIS35, No15, No25;
double No35, WI16, WI26, W36, WP16, WP26, WP36, DV116, DV226, DV336;
double DV126, DV136, DV236, U116, U126, U136, U216, U226, U236, U316;
double U326, U336, VP16, VP26, F16, F26, F36, PIS16, PIS26, PIS36;
double No16, No26, No36, WI17, WI27, W37, WP17, WP27, WP37, DV117;
double DV227, DV337, DV127, DV137, DV237, U117, U127, U137, U217, U227;
double U237, U317, U327, U337, VSP17, VSP27, VSP37, VP17, VP27, F17;
double F27, F37, PIS17, PIS27, PIS37, No17, No27, No37, N17, N27;
double N37, FDI17, FDI37, E16, E26, E36, N16, N26, N36, FDI16;
double FDI36, E15, E25, E35, N15, N25, N35, FDI15, FDI35, E14;
double E24, E34, N14, N24, N34, FDI14, FDI34, E13, E23, N13;
double N23, N33, FDI13, FDI33, N12, N22, N32, N31;

	S2=sin(q2);
	C2=cos(q2);
	S3=sin(q3);
	C3=cos(q3);
	S4=sin(q4);
	C4=cos(q4);
	S5=sin(q5);
	C5=cos(q5);
	S6=cos(q6);
	C6=-sin(q6);
	S7=sin(q7);
	C7=cos(q7);
	No31=I1zz*qdd1;
	WI12=qd1*S2;
	WI22=C2*qd1;
	WP12=qdd1*S2 + qd2*WI22;
	WP22=C2*qdd1 - qd2*WI12;
	DV112=-(WI12*WI12);
	DV222=-(WI22*WI22);
	DV332=-(qd2*qd2);
	DV122=WI12*WI22;
	DV132=qd2*WI12;
	DV232=qd2*WI22;
	U122=DV122 - qdd2;
	U132=DV132 + WP22;
	U212=DV122 + qdd2;
	U222=DV112 + DV332;
	U232=DV232 - WP12;
	U312=DV132 - WP22;
	U322=DV232 + WP12;
	VP12=-(g*S2);
	VP22=-(C2*g);
	PIS12=-I2yy + I2zz;
	PIS22=I2xx - I2zz;
	PIS32=-I2xx + I2yy;
	No12=(-DV222 + DV332)*I2yz + DV232*PIS12 + I2xz*U212 - I2xy*U312 + I2xx*WP12;
	No22=(DV112 - DV332)*I2xz + DV132*PIS22 - I2yz*U122 + I2xy*U322 + I2yy*WP22;
	No32=(-DV112 + DV222)*I2xy + DV122*PIS32 + I2zz*qdd2 + I2yz*U132 - I2xz*U232;
	WI13=-(qd2*S3) + C3*WI12;
	WI23=-(C3*qd2) - S3*WI12;
	W33=qd3 + WI22;
	WP13=-(qdd2*S3) + qd3*WI23 + C3*WP12;
	WP23=-(C3*qdd2) - qd3*WI13 - S3*WP12;
	WP33=qdd3 + WP22;
	DV113=-(WI13*WI13);
	DV223=-(WI23*WI23);
	DV333=-(W33*W33);
	DV123=WI13*WI23;
	DV133=W33*WI13;
	DV233=W33*WI23;
	U113=DV223 + DV333;
	U123=DV123 - WP33;
	U133=DV133 + WP23;
	U213=DV123 + WP33;
	U223=DV113 + DV333;
	U233=DV233 - WP13;
	U313=DV133 - WP23;
	U323=DV233 + WP13;
	VSP13=L2*U122 + VP12;
	VSP23=L2*U222 + VP22;
	VSP33=L2*U322;
	VP13=C3*VSP13 - S3*VSP33;
	VP23=-(S3*VSP13) - C3*VSP33;
	F13=mx3*U113 + my3*U123 + mz3*U133 + m3*VP13;
	F23=mx3*U213 + my3*U223 + mz3*U233 + m3*VP23;
	PIS13=-I3yy + I3zz;
	PIS23=I3xx - I3zz;
	PIS33=-I3xx + I3yy;
	No13=(-DV223 + DV333)*I3yz + DV233*PIS13 + I3xz*U213 - I3xy*U313 + I3xx*WP13;
	No23=(DV113 - DV333)*I3xz + DV133*PIS23 - I3yz*U123 + I3xy*U323 + I3yy*WP23;
	No33=(-DV113 + DV223)*I3xy + DV123*PIS33 + I3yz*U133 - I3xz*U233 + I3zz*WP33;
	WI14=-(S4*W33) + C4*WI13;
	WI24=-(C4*W33) - S4*WI13;
	W34=qd4 + WI23;
	WP14=qd4*WI24 + C4*WP13 - S4*WP33;
	WP24=-(qd4*WI14) - S4*WP13 - C4*WP33;
	WP34=qdd4 + WP23;
	DV114=-(WI14*WI14);
	DV224=-(WI24*WI24);
	DV334=-(W34*W34);
	DV124=WI14*WI24;
	DV134=W34*WI14;
	DV234=W34*WI24;
	U114=DV224 + DV334;
	U124=DV124 - WP34;
	U134=DV134 + WP24;
	U214=DV124 + WP34;
	U224=DV114 + DV334;
	U234=DV234 - WP14;
	U314=DV134 - WP24;
	U324=DV234 + WP14;
	U334=DV114 + DV224;
	VSP14=L5*U113 + VP13;
	VSP24=L5*U213 + VP23;
	VSP34=L5*U313 + VSP23;
	VP14=C4*VSP14 - S4*VSP34;
	VP24=-(S4*VSP14) - C4*VSP34;
	F14=mx4*U114 + my4*U124 + mz4*U134 + m4*VP14;
	F24=mx4*U214 + my4*U224 + mz4*U234 + m4*VP24;
	F34=mx4*U314 + my4*U324 + mz4*U334 + m4*VSP24;
	PIS14=-I4yy + I4zz;
	PIS24=I4xx - I4zz;
	PIS34=-I4xx + I4yy;
	No14=(-DV224 + DV334)*I4yz + DV234*PIS14 + I4xz*U214 - I4xy*U314 + I4xx*WP14;
	No24=(DV114 - DV334)*I4xz + DV134*PIS24 - I4yz*U124 + I4xy*U324 + I4yy*WP24;
	No34=(-DV114 + DV224)*I4xy + DV124*PIS34 + I4yz*U134 - I4xz*U234 + I4zz*WP34;
	WI15=S5*W34 + C5*WI14;
	WI25=C5*W34 - S5*WI14;
	W35=qd5 - WI24;
	WP15=qd5*WI25 + C5*WP14 + S5*WP34;
	WP25=-(qd5*WI15) - S5*WP14 + C5*WP34;
	WP35=qdd5 - WP24;
	DV115=-(WI15*WI15);
	DV225=-(WI25*WI25);
	DV335=-(W35*W35);
	DV125=WI15*WI25;
	DV135=W35*WI15;
	DV235=W35*WI25;
	U115=DV225 + DV335;
	U125=DV125 - WP35;
	U135=DV135 + WP25;
	U215=DV125 + WP35;
	U225=DV115 + DV335;
	U235=DV235 - WP15;
	U315=DV135 - WP25;
	U325=DV235 + WP15;
	U335=DV115 + DV225;
	VSP15=-(L5*U114) - L3*U124 + VP14;
	VSP25=-(L5*U214) - L3*U224 + VP24;
	VSP35=-(L5*U314) - L3*U324 + VSP24;
	VP15=C5*VSP15 + S5*VSP35;
	VP25=-(S5*VSP15) + C5*VSP35;
	F15=mx5*U115 + my5*U125 + mz5*U135 + m5*VP15;
	F25=mx5*U215 + my5*U225 + mz5*U235 + m5*VP25;
	F35=mx5*U315 + my5*U325 + mz5*U335 - m5*VSP25;
	PIS15=-I5yy + I5zz;
	PIS25=I5xx - I5zz;
	PIS35=-I5xx + I5yy;
	No15=(-DV225 + DV335)*I5yz + DV235*PIS15 + I5xz*U215 - I5xy*U315 + I5xx*WP15;
	No25=(DV115 - DV335)*I5xz + DV135*PIS25 - I5yz*U125 + I5xy*U325 + I5yy*WP25;
	No35=(-DV115 + DV225)*I5xy + DV125*PIS35 + I5yz*U135 - I5xz*U235 + I5zz*WP35;
	WI16=S6*W35 + C6*WI15;
	WI26=C6*W35 - S6*WI15;
	W36=qd6 - WI25;
	WP16=qd6*WI26 + C6*WP15 + S6*WP35;
	WP26=-(qd6*WI16) - S6*WP15 + C6*WP35;
	WP36=qdd6 - WP25;
	DV116=-(WI16*WI16);
	DV226=-(WI26*WI26);
	DV336=-(W36*W36);
	DV126=WI16*WI26;
	DV136=W36*WI16;
	DV236=W36*WI26;
	U116=DV226 + DV336;
	U126=DV126 - WP36;
	U136=DV136 + WP26;
	U216=DV126 + WP36;
	U226=DV116 + DV336;
	U236=DV236 - WP16;
	U316=DV136 - WP26;
	U326=DV236 + WP16;
	U336=DV116 + DV226;
	VP16=C6*VP15 - S6*VSP25;
	VP26=-(S6*VP15) - C6*VSP25;
	F16=mx6*U116 + my6*U126 + mz6*U136 + m6*VP16;
	F26=mx6*U216 + my6*U226 + mz6*U236 + m6*VP26;
	F36=mx6*U316 + my6*U326 + mz6*U336 - m6*VP25;
	PIS16=-I6yy + I6zz;
	PIS26=I6xx - I6zz;
	PIS36=-I6xx + I6yy;
	No16=(-DV226 + DV336)*I6yz + DV236*PIS16 + I6xz*U216 - I6xy*U316 + I6xx*WP16;
	No26=(DV116 - DV336)*I6xz + DV136*PIS26 - I6yz*U126 + I6xy*U326 + I6yy*WP26;
	No36=(-DV116 + DV226)*I6xy + DV126*PIS36 + I6yz*U136 - I6xz*U236 + I6zz*WP36;
	WI17=S7*W36 + C7*WI16;
	WI27=C7*W36 - S7*WI16;
	W37=qd7 - WI26;
	WP17=qd7*WI27 + C7*WP16 + S7*WP36;
	WP27=-(qd7*WI17) - S7*WP16 + C7*WP36;
	WP37=qdd7 - WP26;
	DV117=-(WI17*WI17);
	DV227=-(WI27*WI27);
	DV337=-(W37*W37);
	DV127=WI17*WI27;
	DV137=W37*WI17;
	DV237=W37*WI27;
	U117=DV227 + DV337;
	U127=DV127 - WP37;
	U137=DV137 + WP27;
	U217=DV127 + WP37;
	U227=DV117 + DV337;
	U237=DV237 - WP17;
	U317=DV137 - WP27;
	U327=DV237 + WP17;
	U337=DV117 + DV227;
	VSP17=L4*U116 + VP16;
	VSP27=L4*U216 + VP26;
	VSP37=L4*U316 - VP25;
	VP17=C7*VSP17 + S7*VSP37;
	VP27=-(S7*VSP17) + C7*VSP37;
	F17=mx7*U117 + my7*U127 + mz7*U137 + m7*VP17;
	F27=mx7*U217 + my7*U227 + mz7*U237 + m7*VP27;
	F37=mx7*U317 + my7*U327 + mz7*U337 - m7*VSP27;
	PIS17=-I7yy + I7zz;
	PIS27=I7xx - I7zz;
	PIS37=-I7xx + I7yy;
	No17=(-DV227 + DV337)*I7yz + DV237*PIS17 + I7xz*U217 - I7xy*U317 + I7xx*WP17;
	No27=(DV117 - DV337)*I7xz + DV137*PIS27 - I7yz*U127 + I7xy*U327 + I7yy*WP27;
	No37=(-DV117 + DV227)*I7xy + DV127*PIS37 + I7yz*U137 - I7xz*U237 + I7zz*WP37;
	N17=No17 - mz7*VP27 - my7*VSP27;
	N27=No27 + mz7*VP17 + mx7*VSP27;
	N37=No37 - my7*VP17 + mx7*VP27;
	FDI17=C7*F17 - F27*S7;
	FDI37=C7*F27 + F17*S7;
	E16=F16 + FDI17;
	E26=F26 - F37;
	E36=F36 + FDI37;
	N16=C7*N17 + No16 - N27*S7 - my6*VP25 - mz6*VP26;
	N26=-(FDI37*L4) - N37 + No26 + mz6*VP16 + mx6*VP25;
	N36=-(F37*L4) + C7*N27 + No36 + N17*S7 - my6*VP16 + mx6*VP26;
	FDI16=C6*E16 - E26*S6;
	FDI36=C6*E26 + E16*S6;
	E15=F15 + FDI16;
	E25=-E36 + F25;
	E35=F35 + FDI36;
	N15=C6*N16 + No15 - N26*S6 - mz5*VP25 - my5*VSP25;
	N25=-N36 + No25 + mz5*VP15 + mx5*VSP25;
	N35=C6*N26 + No35 + N16*S6 - my5*VP15 + mx5*VP25;
	FDI15=C5*E15 - E25*S5;
	FDI35=C5*E25 + E15*S5;
	E14=F14 + FDI15;
	E24=-E35 + F24;
	E34=F34 + FDI35;
	N14=-(FDI35*L3) + C5*N15 + No14 - N25*S5 - mz4*VP24 + my4*VSP24;
	N24=FDI35*L5 - N35 + No24 + mz4*VP14 - mx4*VSP24;
	N34=FDI15*L3 + E35*L5 + C5*N25 + No34 + N15*S5 - my4*VP14 + mx4*VP24;
	FDI14=C4*E14 - E24*S4;
	FDI34=-(C4*E24) - E14*S4;
	E13=F13 + FDI14;
	E23=E34 + F23;
	N13=C4*N14 + No13 - N24*S4 - mz3*VP23 + my3*VSP23;
	N23=-(FDI34*L5) + N34 + No23 + mz3*VP13 - mx3*VSP23;
	N33=E34*L5 - C4*N24 + No33 - N14*S4 - my3*VP13 + mx3*VP23;
	FDI13=C3*E13 - E23*S3;
	FDI33=-(C3*E23) - E13*S3;
	N12=FDI33*L2 + C3*N13 + No12 - N23*S3 - mz2*VP22;
	N22=N33 + No22 + mz2*VP12;
	N32=-(FDI13*L2) - C3*N23 + No32 - N13*S3 - my2*VP12 + mx2*VP22;
	N31=C2*N22 + No31 + N12*S2;
	GAM1=N31 + Fv1*qd1 + Ia1*qdd1 + Fc1*sign(qd1);
	GAM2=N32 + Fv2*qd2 + Ia2*qdd2 + Fc2*sign(qd2);
	GAM3=N33 + Fv3*qd3 + Ia3*qdd3 + Fc3*sign(qd3);
	GAM4=N34 + Fv4*qd4 + Ia4*qdd4 + Fc4*sign(qd4);
	GAM5=N35 + Fv5*qd5 + Ia5*qdd5 + Fc5*sign(qd5);
	GAM6=N36 + Fv6*qd6 + Ia6*qdd6 + Fc6*sign(qd6);
	GAM7=N37 + Fv7*qd7 + Ia7*qdd7 + Fc7*sign(qd7);
}

/* *=* */
/* Number of operations : 380 '+' or '-', 383 '*' or '/' */
