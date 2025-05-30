/* (********************************************) */
/* (** SYMORO+ : SYmbolic MOdelling of RObots **) */
/* (**========================================**) */
/* (**      IRCCyN-ECN - 1, rue de la Noe     **) */
/* (**      B.P.92101                         **) */
/* (**      44321 Nantes cedex 3, FRANCE      **) */
/* (**      www.irccyn.ec-nantes.fr           **) */
/* (********************************************) */


/*    Name of file : C:/Users/Administrator/Desktop/SYMORO_WS/Robots/racer3_52_paras_Load/racer3_52plus10_paras_Load.jpqp */




/*      Geometric parameters    */


/* j        ant      mu       sigma    gamma    b        alpha    d        theta    r */


/* 1        0        1        0        0        0        0        0        q1       L2 */

/*                                                       -Pi               -Pi */
/* 2        1        1        0        0        0        ---      L1       --- + q2 0 */
/*                                                        2                 2 */

/* 3        2        1        0        0        0        0        L3       q3       0 */

/*                                                       -Pi */
/* 4        3        1        0        0        0        ---      L4       q4       L5 */
/*                                                        2 */
/*                                                       Pi */
/* 5        4        1        0        0        0        --       0        q5       0 */
/*                                                       2 */
/*                                                       -Pi */
/* 6        5        1        0        0        0        ---      0        q6       0 */
/*                                                        2 */

/* 7        6        0        2        0        0        0        0        0        L6 */


/*                             JPQP  */


/* *=* */
/* Number of operations : 54 '+' or '-', 88 '*' or '/' */
/* Equations: */

#include <stdio.h>
#include <math.h>

#define sign(x) (x<0.0 ? -1.0 : (x==0.0 ? 0.0 : 1.0))

/* Declaration of global input variables */
extern double q2, q3, q4, q5, q6, qd1, qd2, L1, qd3, L3;
extern double qd4, L5, L4, qd5, qd6, L6;

/* Declaration of global output variables */
extern double WPJ11, WPJ21, WPJ31, VPJ11, VPJ21, VPJ31, WPJ12, WPJ22, WPJ32, VPJ12;
extern double VPJ22, VPJ32, WPJ13, WPJ23, WPJ33, VPJ13, VPJ23, VPJ33, WPJ14, WPJ24;
extern double WPJ34, VPJ14, VPJ24, VPJ34, WPJ15, WPJ25, WPJ35, VPJ15, VPJ25, VPJ35;
extern double WPJ16, WPJ26, WPJ36, VPJ16, VPJ26, VPJ36, WPJ17, WPJ27, WPJ37, VPJ17;
extern double VPJ27, VPJ37;

/* Declaration of the function */
void racer3_52plus10_paras_Load_jpqp()
{
double S2, C2, S3, C3, S4, C4, S5, C5, S6, C6;
double DV331, WI12, WI22, DV222, DV332, DV122, DV132, U112, U312, VSP12;
double WI13, WI23, W33, DV113, DV223, DV333, DV123, DV133, DV233, U113;
double U223, U313, U323, VSP13, VSP23, VSP33, WI14, WI24, W34, VSP14;
double VSP24, VSP34, WI15, WI25, W35, WI16, WI26, W36, DV116, DV226;
double DV136, DV236, U136, U236, U336, VSP17, VSP27, VSP37;

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
	WPJ11=0;
	WPJ21=0;
	WPJ31=0;
	DV331=-(qd1*qd1);
	VPJ11=0;
	VPJ21=0;
	VPJ31=0;
	WI12=-(qd1*S2);
	WI22=-(C2*qd1);
	WPJ12=qd2*WI22;
	WPJ22=-(qd2*WI12);
	WPJ32=0;
	DV222=-(WI22*WI22);
	DV332=-(qd2*qd2);
	DV122=WI12*WI22;
	DV132=qd2*WI12;
	U112=DV222 + DV332;
	U312=DV132 - WPJ22;
	VSP12=DV331*L1;
	VPJ12=C2*VSP12;
	VPJ22=-(S2*VSP12);
	VPJ32=0;
	WI13=C3*WI12 + S3*WI22;
	WI23=-(S3*WI12) + C3*WI22;
	W33=qd2 + qd3;
	WPJ13=qd3*WI23 + C3*WPJ12 + S3*WPJ22;
	WPJ23=-(qd3*WI13) - S3*WPJ12 + C3*WPJ22;
	WPJ33=0;
	DV113=-(WI13*WI13);
	DV223=-(WI23*WI23);
	DV333=-(W33*W33);
	DV123=WI13*WI23;
	DV133=W33*WI13;
	DV233=W33*WI23;
	U113=DV223 + DV333;
	U223=DV113 + DV333;
	U313=DV133 - WPJ23;
	U323=DV233 + WPJ13;
	VSP13=L3*U112 + VPJ12;
	VSP23=DV122*L3 + VPJ22;
	VSP33=L3*U312;
	VPJ13=C3*VSP13 + S3*VSP23;
	VPJ23=-(S3*VSP13) + C3*VSP23;
	VPJ33=VSP33;
	WI14=-(S4*W33) + C4*WI13;
	WI24=-(C4*W33) - S4*WI13;
	W34=qd4 + WI23;
	WPJ14=qd4*WI24 + C4*WPJ13;
	WPJ24=-(qd4*WI14) - S4*WPJ13;
	WPJ34=WPJ23;
	VSP14=DV123*L5 + L4*U113 + VPJ13;
	VSP24=DV123*L4 + L5*U223 + VPJ23;
	VSP34=L4*U313 + L5*U323 + VSP33;
	VPJ14=C4*VSP14 - S4*VSP34;
	VPJ24=-(S4*VSP14) - C4*VSP34;
	VPJ34=VSP24;
	WI15=S5*W34 + C5*WI14;
	WI25=C5*W34 - S5*WI14;
	W35=qd5 - WI24;
	WPJ15=qd5*WI25 + C5*WPJ14 + S5*WPJ23;
	WPJ25=-(qd5*WI15) - S5*WPJ14 + C5*WPJ23;
	WPJ35=-WPJ24;
	VPJ15=C5*VPJ14 + S5*VSP24;
	VPJ25=-(S5*VPJ14) + C5*VSP24;
	VPJ35=-VPJ24;
	WI16=-(S6*W35) + C6*WI15;
	WI26=-(C6*W35) - S6*WI15;
	W36=qd6 + WI25;
	WPJ16=qd6*WI26 + C6*WPJ15 + S6*WPJ24;
	WPJ26=-(qd6*WI16) - S6*WPJ15 + C6*WPJ24;
	WPJ36=WPJ25;
	DV116=-(WI16*WI16);
	DV226=-(WI26*WI26);
	DV136=W36*WI16;
	DV236=W36*WI26;
	U136=DV136 + WPJ26;
	U236=DV236 - WPJ16;
	U336=DV116 + DV226;
	VPJ16=C6*VPJ15 + S6*VPJ24;
	VPJ26=-(S6*VPJ15) + C6*VPJ24;
	VPJ36=VPJ25;
	WPJ17=WPJ16;
	WPJ27=WPJ26;
	WPJ37=WPJ25;
	VSP17=L6*U136 + VPJ16;
	VSP27=L6*U236 + VPJ26;
	VSP37=L6*U336 + VPJ25;
	VPJ17=VSP17;
	VPJ27=VSP27;
	VPJ37=VSP37;
}