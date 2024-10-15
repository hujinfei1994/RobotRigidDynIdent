% (********************************************)
% (** SYMORO+ : SYmbolic MOdelling of RObots **)
% (**========================================**)
% (**      IRCCyN-ECN - 1, rue de la Noe     **)
% (**      B.P.92101                         **)
% (**      44321 Nantes cedex 3, FRANCE      **)
% (**      www.irccyn.ec-nantes.fr           **)
% (********************************************)
% 
% 
%    Name of file : C:/Users/Administrator/Desktop/SYMORO_WS/Robots/racer3_48_paras/racer3_52_parasbase.par
% 
% 
% 
% 
%      Geometric parameters   
% 
% 
% j        ant      mu       sigma    gamma    b        alpha    d        theta    r
% 
% 
% 1        0        1        0        0        0        0        0        q1       L2
% 
%                                                       -Pi               -Pi
% 2        1        1        0        0        0        ---      L1       --- + q2 0
%                                                        2                 2
% 
% 3        2        1        0        0        0        0        L3       q3       0
% 
%                                                       -Pi
% 4        3        1        0        0        0        ---      L4       q4       L5
%                                                        2
%                                                       Pi
% 5        4        1        0        0        0        --       0        q5       0
%                                                       2
%                                                       -Pi
% 6        5        1        0        0        0        ---      0        q6       0
%                                                        2
% 
% 
% 
%              Inertial parameters
% 
% j      XX     XY     XZ     YY     YZ     ZZ     MX     MY     MZ     M      Ia
% 
% 1      I1xx   I1xy   I1xz   I1yy   I1yz   I1zz   mx1    my1    mz1    m1     Ia1
% 
% 2      I2xx   I2xy   I2xz   I2yy   I2yz   I2zz   mx2    my2    mz2    m2     Ia2
% 
% 3      I3xx   I3xy   I3xz   I3yy   I3yz   I3zz   mx3    my3    mz3    m3     Ia3
% 
% 4      I4xx   I4xy   I4xz   I4yy   I4yz   I4zz   mx4    my4    mz4    m4     Ia4
% 
% 5      I5xx   I5xy   I5xz   I5yy   I5yz   I5zz   mx5    my5    mz5    m5     Ia5
% 
% 6      I6xx   I6xy   I6xz   I6yy   I6yz   I6zz   mx6    my6    mz6    m6     Ia6
% 
%  The regrouping relations are 

clear;clc;
syms m1 mx1 my1 mz1 I1xx I1xy I1xz I1yy I1yz I1zz Ia1 Fc1 Fv1 real
syms m2 mx2 my2 mz2 I2xx I2xy I2xz I2yy I2yz I2zz Ia2 Fc2 Fv2 real
syms m3 mx3 my3 mz3 I3xx I3xy I3xz I3yy I3yz I3zz Ia3 Fc3 Fv3 real
syms m4 mx4 my4 mz4 I4xx I4xy I4xz I4yy I4yz I4zz Ia4 Fc4 Fv4 real
syms m5 mx5 my5 mz5 I5xx I5xy I5xz I5yy I5yz I5zz Ia5 Fc5 Fv5 real
syms m6 mx6 my6 mz6 I6xx I6xy I6xz I6yy I6yz I6zz Ia6 Fc6 Fv6 real
% syms L1 L2 L3 L4 L5 L6 real
L1 = 0.050;
L2 = 0.365;
L3 = 0.270;
L4 = 0.050;
L5 = 0.30594;
L6 = 0.080;

betas = [ m1 mx1 my1 mz1 I1xx I1xy I1xz I1yy I1yz I1zz Ia1 Fc1 Fv1...
        m2 mx2 my2 mz2 I2xx I2xy I2xz I2yy I2yz I2zz Ia2 Fc2 Fv2...
        m3 mx3 my3 mz3 I3xx I3xy I3xz I3yy I3yz I3zz Ia3 Fc3 Fv3...
        m4 mx4 my4 mz4 I4xx I4xy I4xz I4yy I4yz I4zz Ia4 Fc4 Fv4...
        m5 mx5 my5 mz5 I5xx I5xy I5xz I5yy I5yz I5zz Ia5 Fc5 Fv5...
        m6 mx6 my6 mz6 I6xx I6xy I6xz I6yy I6yz I6zz Ia6 Fc6 Fv6]; 
betas_str={'m1' 'mx1' 'my1' 'mz1' 'I1xx' 'I1xy' 'I1xz' 'I1yy' 'I1yz' 'I1zz' 'Ia1' 'Fc1' 'Fv1' 'm2' 'mx2' 'my2' 'mz2' 'I2xx' 'I2xy' 'I2xz' 'I2yy' 'I2yz' 'I2zz' 'Ia2' 'Fc2' 'Fv2' 'm3' 'mx3' 'my3' 'mz3' 'I3xx' 'I3xy' 'I3xz' 'I3yy' 'I3yz' 'I3zz' 'Ia3' 'Fc3' 'Fv3' 'm4' 'mx4' 'my4' 'mz4' 'I4xx' 'I4xy' 'I4xz' 'I4yy' 'I4yz' 'I4zz' 'Ia4' 'Fc4' 'Fv4' 'm5' 'mx5' 'my5' 'mz5' 'I5xx' 'I5xy' 'I5xz' 'I5yy' 'I5yz' 'I5zz' 'Ia5' 'Fc5' 'Fv5' 'm6' 'mx6' 'my6' 'mz6' 'I6xx' 'I6xy' 'I6xz' 'I6yy' 'I6yz' 'I6zz' 'Ia6' 'Fc6' 'Fv6'};   

ZZ1R=I1zz + I2yy + I3yy + Ia1 + L4^2*(m4 + m5 + m6) + L3^2*(m3 + m4 + m5 + m6) + L1^2*(m2 + m3 + m4 + m5 + m6);
XX2R=I2xx - I2yy - L3^2*(m3 + m4 + m5 + m6);
XZ2R=I2xz - L3*mz3;
ZZ2R=I2zz + Ia2 + L3^2*(m3 + m4 + m5 + m6);
MX2R=L3*(m3 + m4 + m5 + m6) + mx2;
XX3R=I3xx - I3yy + I4yy - L4^2*(m4 + m5 + m6) + L5^2*(m4 + m5 + m6) + 2*L5*mz4;
XY3R=I3xy - L4*L5*(m4 + m5 + m6) - L4*mz4;
ZZ3R=I3zz + I4yy + (L4^2 + L5^2)*(m4 + m5 + m6) + 2*L5*mz4;
MX3R=L4*(m4 + m5 + m6) + mx3;
MY3R=L5*(m4 + m5 + m6) + my3 + mz4;
XX4R=I4xx - I4yy + I5yy;
ZZ4R=I4zz + I5yy;
MY4R=my4 - mz5;
XX5R=I5xx - I5yy + I6yy;
ZZ5R=I5zz + I6yy;
MY5R=my5 + mz6;
XX6R=I6xx - I6yy;
beta = [XX2R XX3R XX4R XX5R XX6R I2xy XY3R I4xy I5xy I6xy XZ2R I3xz I4xz I5xz I6xz I2yz I3yz I4yz I5yz I6yz ZZ1R ZZ2R ZZ3R ZZ4R ZZ5R I6zz MX2R MX3R mx4 mx5 mx6 my2 MY3R MY4R MY5R my6 Ia3 Ia4 Ia5 Ia6 Fc1 Fv1 Fc2 Fv2 Fc3 Fv3 Fc4 Fv4 Fc5 Fv5 Fc6 Fv6];

row = length(beta);
col = length(betas);
T = zeros(row,col);
for i = 1:row
    flag = 0;
    for j = 1:col
        if(isequal(beta(i),betas(j)))
            T(i,j) = 1;
            flag = 1;
            break;
        else
            T(i,j) = 0;
        end
    end
    if(flag==0)
        fprintf([num2str(i)])
        fprintf(['\n'])
        tic
        T(i,:) = double(get_regressor(beta(i),betas_str,betas_str));
        toc
    end
end

save T_para_regp_racer3_52_78.mat T

simplify(beta-T*betas')




%  The base inertial parameters are 
% 
%              Inertial parameters
% 
% j      XX     XY     XZ     YY     YZ     ZZ     MX     MY     MZ     M      Ia
% 
% 1      0      0      0      0      0      ZZ1R   0      0      0      0      0
% 
% 2      XX2R   I2xy   XZ2R   0      I2yz   ZZ2R   MX2R   my2    0      0      0
% 
% 3      XX3R   XY3R   I3xz   0      I3yz   ZZ3R   MX3R   MY3R   0      0      Ia3
% 
% 4      XX4R   I4xy   I4xz   0      I4yz   ZZ4R   mx4    MY4R   0      0      Ia4
% 
% 5      XX5R   I5xy   I5xz   0      I5yz   ZZ5R   mx5    MY5R   0      0      Ia5
% 
% 6      XX6R   I6xy   I6xz   0      I6yz   I6zz   mx6    my6    0      0      Ia6

