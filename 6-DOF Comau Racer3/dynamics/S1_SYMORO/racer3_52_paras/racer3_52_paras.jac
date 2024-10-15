(********************************************)
(** SYMORO+ : SYmbolic MOdelling of RObots **)
(**========================================**)
(**      IRCCyN-ECN - 1, rue de la Noe     **)
(**      B.P.92101                         **)
(**      44321 Nantes cedex 3, FRANCE      **)
(**      www.irccyn.ec-nantes.fr           **)
(********************************************)


   Name of file : C:/Users/Administrator/Desktop/SYMORO_WS/Robots/racer3_48_paras/racer3_52_paras.jac




     Geometric parameters   


j        ant      mu       sigma    gamma    b        alpha    d        theta    r


1        0        1        0        0        0        0        0        q1       L2

                                                      -Pi               -Pi
2        1        1        0        0        0        ---      L1       --- + q2 0
                                                       2                 2

3        2        1        0        0        0        0        L3       q3       0

                                                      -Pi
4        3        1        0        0        0        ---      L4       q4       L5
                                                       2
                                                      Pi
5        4        1        0        0        0        --       0        q5       0
                                                      2
                                                      -Pi
6        5        1        0        0        0        ---      0        q6       0
                                                       2

Size=( 6 , 6 )
Jacobian Matrix of frame 6 projected  into frame 0. Intermediate frame = 6
----------------------------------


J(1,1) = -(L1*Sin(q1)) - L5*Cos(q2 + q3)*Sin(q1) - L3*Sin(q1)*Sin(q2) - 
  L4*Sin(q1)*Sin(q2 + q3)

J(2,1) = L1*Cos(q1) + L5*Cos(q1)*Cos(q2 + q3) + L3*Cos(q1)*Sin(q2) + 
  L4*Cos(q1)*Sin(q2 + q3)

J(3,1) = 0

J(4,1) = 0

J(5,1) = 0

J(6,1) = 1

J(1,2) = L3*Cos(q1)*Cos(q2) + L4*Cos(q1)*Cos(q2 + q3) - L5*Cos(q1)*Sin(q2 + q3)

J(2,2) = L3*Cos(q2)*Sin(q1) + L4*Cos(q2 + q3)*Sin(q1) - L5*Sin(q1)*Sin(q2 + q3)

J(3,2) = -(L5*Cos(q2 + q3)) - L3*Sin(q2) - L4*Sin(q2 + q3)

J(4,2) = -Sin(q1)

J(5,2) = Cos(q1)

J(6,2) = 0

J(1,3) = L4*Cos(q1)*Cos(q2 + q3) - L5*Cos(q1)*Sin(q2 + q3)

J(2,3) = L4*Cos(q2 + q3)*Sin(q1) - L5*Sin(q1)*Sin(q2 + q3)

J(3,3) = -(L5*Cos(q2 + q3)) - L4*Sin(q2 + q3)

J(4,3) = -Sin(q1)

J(5,3) = Cos(q1)

J(6,3) = 0

J(1,4) = 0

J(2,4) = 0

J(3,4) = 0

J(4,4) = Cos(q1)*Cos(q2 + q3)

J(5,4) = Cos(q2 + q3)*Sin(q1)

J(6,4) = -Sin(q2 + q3)

J(1,5) = 0

J(2,5) = 0

J(3,5) = 0

J(4,5) = -(Cos(q4)*Sin(q1)) + Cos(q1)*Sin(q2 + q3)*Sin(q4)

J(5,5) = Cos(q1)*Cos(q4) + Sin(q1)*Sin(q2 + q3)*Sin(q4)

J(6,5) = Cos(q2 + q3)*Sin(q4)

J(1,6) = 0

J(2,6) = 0

J(3,6) = 0

J(4,6) = Cos(q1)*Cos(q2 + q3)*Cos(q5) - Cos(q1)*Cos(q4)*Sin(q2 + q3)*Sin(q5) - 
  Sin(q1)*Sin(q4)*Sin(q5)

J(5,6) = Cos(q2 + q3)*Cos(q5)*Sin(q1) - Cos(q4)*Sin(q1)*Sin(q2 + q3)*Sin(q5) + 
  Cos(q1)*Sin(q4)*Sin(q5)

J(6,6) = -(Cos(q5)*Sin(q2 + q3)) - Cos(q2 + q3)*Cos(q4)*Sin(q5)




                  I3,3 | L12
      Matrix L =  
                  03,3 | I3,3


L12 (1,1) = 0

L12 (2,1) = 0

L12 (3,1) = 0

L12 (1,2) = 0

L12 (2,2) = 0

L12 (3,2) = 0

L12 (1,3) = 0

L12 (2,3) = 0

L12 (3,3) = 0

         vector VQP = 

qd1
qd2
qd3
qd4
qd5
qd6
