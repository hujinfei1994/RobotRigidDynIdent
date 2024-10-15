load franka_getY.mat
L1=1;L2=1;L3=1;L5=1;L6=1;g=1;q2=1;q3=1;q4=1;q5=1;q6=1;q7=1;qd1=1;qd2=1;qd3=1;qd4=1;qd5=1;qd6=1;qd7=1;qdd1=1;qdd2=1;qdd3=1;qdd4=1;qdd5=1;qdd6=1;qdd7=1;

tic
loop_num=1000;
for i=1:loop_num
    Y = franka_getY(L1,L2,L3,L5,L6,g,q2,q3,q4,q5,q6,q7,qd1,qd2,qd3,qd4,qd5,qd6,qd7,qdd1,qdd2,qdd3,qdd4,qdd5,qdd6,qdd7);
end
toc

