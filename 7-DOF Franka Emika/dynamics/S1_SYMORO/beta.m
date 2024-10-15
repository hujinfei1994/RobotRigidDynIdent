ZZ1R=I1zz + I2yy + Ia1;
XX2R=I2xx - I2yy + I3yy + L1**2*(m4 + m5 + m6 + m7) + L5**2*(m3 + m4 + m5 + m6 + m7) + 2*L5*mz3;
ZZ2R=I2zz + I3yy + Ia2 + L1**2*(m4 + m5 + m6 + m7) + L5**2*(m3 + m4 + m5 + m6 + m7) + 2*L5*mz3;
MY2R=-(L5*(m3 + m4 + m5 + m6 + m7)) + my2 - mz3;
XX3R=I3xx - I3yy + I4yy + L2**2*(m5 + m6 + m7) - L1**2*(m4 + m5 + m6 + m7);
XY3R=I3xy + L1*mz4;
ZZ3R=I3zz + I4yy + L2**2*(m5 + m6 + m7) + L1**2*(m4 + m5 + m6 + m7);
MX3R=L1*(m4 + m5 + m6 + m7) + mx3;
MY3R=my3 - mz4;
XX4R=I4xx - I4yy + I5yy - L2**2*(m5 + m6 + m7) + L6**2*(m5 + m6 + m7) + 2*L6*mz5;
XY4R=I4xy - L2*L6*(m5 + m6 + m7) - L2*mz5;
ZZ4R=I4zz + I5yy + (L2**2 + L6**2)*(m5 + m6 + m7) + 2*L6*mz5;
MX4R=L2*(m5 + m6 + m7) + mx4;
MY4R=L6*(m5 + m6 + m7) + my4 + mz5;
XX5R=I5xx - I5yy + I6yy + L3**2*m7;
ZZ5R=I5zz + I6yy + L3**2*m7;
MY5R=my5 - mz6;
XX6R=I6xx - I6yy + I7yy - L3**2*m7;
XY6R=I6xy + L3*mz7;
ZZ6R=I6zz + I7yy + L3**2*m7;
MX6R=L3*m7 + mx6;
MY6R=my6 - mz7;
XX7R=I7xx - I7yy;

beta33:=L1*(m4 + m5 + m6 + m7) + mx3:
beta34:=L2*(m5 + m6 + m7) + mx4:
beta36:=L3*m7 + mx6:
beta38:=-(L5*(m3 + m4 + m5 + m6 + m7)) + my2 - mz3:
beta40:=L6*(m5 + m6 + m7) + my4 + mz5:




ZZ1R=I1zz + I2yy + Ia1;
XX2R=I2xx - I2yy + I3yy + L1^2*(m4 + m5 + m6 + m7) + L5^2*(m3 + m4 + m5 + m6 + m7) + 2*L5*mz3;
ZZ2R=I2zz + I3yy + Ia2 + L1^2*(m4 + m5 + m6 + m7) + L5^2*(m3 + m4 + m5 + m6 + m7) + 2*L5*mz3;
MY2R=-(L5*(m3 + m4 + m5 + m6 + m7)) + my2 - mz3;
XX3R=I3xx - I3yy + I4yy + L2^2*(m5 + m6 + m7) - L1^2*(m4 + m5 + m6 + m7);
XY3R=I3xy + L1*mz4;
ZZ3R=I3zz + I4yy + L2^2*(m5 + m6 + m7) + L1^2*(m4 + m5 + m6 + m7);
MX3R=L1*(m4 + m5 + m6 + m7) + mx3;
MY3R=my3 - mz4;
XX4R=I4xx - I4yy + I5yy - L2^2*(m5 + m6 + m7) + L6^2*(m5 + m6 + m7) + 2*L6*mz5;
XY4R=I4xy - L2*L6*(m5 + m6 + m7) - L2*mz5;
ZZ4R=I4zz + I5yy + (L2^2 + L6^2)*(m5 + m6 + m7) + 2*L6*mz5;
MX4R=L2*(m5 + m6 + m7) + mx4;
MY4R=L6*(m5 + m6 + m7) + my4 + mz5;
XX5R=I5xx - I5yy + I6yy + L3^2*m7;
ZZ5R=I5zz + I6yy + L3^2*m7;
MY5R=my5 - mz6;
XX6R=I6xx - I6yy + I7yy - L3^2*m7;
XY6R=I6xy + L3*mz7;
ZZ6R=I6zz + I7yy + L3^2*m7;
MX6R=L3*m7 + mx6;
MY6R=my6 - mz7;
XX7R=I7xx - I7yy;



beta1 = XXR2;
beta2 = XXR3;
beta3 = XXR4;
beta4 = XXR5;
beta5 = XXR6;
beta6 = XXR7;

beta7 = I2xy;
beta8 = XYR3;
beta9 = XYR4;
beta10 = I5xy;
beta11 = XYR6;
beta12 = I7xy;

beta13 = I2xz;
beta14 = I3xz;
beta15 = I4xz;
beta16 = I5xz;
beta17 = I6xz;
beta18 = I7xz;

beta19 = I2yz;
beta20 = I3yz;
beta21 = I4yz;
beta22 = I5yz;
beta23 = I6yz;
beta24 = I7yz;

beta25 = ZZR1;
beta26 = ZZR2;
beta27 = ZZR3;
beta28 = ZZR4;
beta29 = ZZR5;
beta30 = ZZR6;
beta31 = I7zz;

beta32 = mx2;
beta33 = MXR3;
beta34 = MXR4;
beta35 = mx5;
beta36 = MXR6;
beta37 = mx7;

beta38 = MYR2;
beta39 = MYR3;
beta40 = MYR4;
beta41 = MYR5;
beta42 = MYR6;
beta43 = my7;

beta44 = Ia3;
beta45 = Ia4;
beta46 = Ia5;
beta47 = Ia6;
beta48 = Ia7;



beta1 := XXR2;
beta2 := XXR3;
beta3 := XXR4;
beta4 := XXR5;
beta5 := XXR6;
beta6 := XXR7;

beta7 := I2xy;
beta8 := XYR3;
beta9 := I4xy;
beta10 := I5xy;
beta11 := I6xy;
beta12 := I6xy;

beta11 := XZR2;
beta12 := I3xz;
beta13 := I4xz;
beta14 := I5xz;
beta15 := I6xz;
beta16 := I2yz;
beta17 := I3yz;
beta18 := I4yz;
beta19 := I5yz;
beta20 := I6yz;
beta21 := ZZR1;
beta22 := ZZR2;
beta23 := ZZR3;
beta24 := ZZR4;
beta25 := ZZR5;
beta26 := I6zz;
beta27 := MXR2;
beta28 := MXR3;
beta29 := mx4;
beta30 := mx5;
beta31 := mx6;
beta32 := my2;
beta33 := MYR3;
beta34 := MYR4;
beta35 := MYR5;
beta36 := my6;
beta37 := Ia3;
beta38 := Ia4;
beta39 := Ia5;
beta40 := Ia6;


