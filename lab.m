clear all;
clc;

L1=52;
L2=93;
x1=0.3540;
x2=0.4738;
x3=0.9491;
x4=0.2284;
x5=1.2804;
x6=0.5727;
L0=[x1;x2;x3;x4;x5;x6];
[X1 Y1 X2 Y2]=cal_plot(L1,L2,L0);
figure(1)
plot(X1+100,Y1,"-r");
hold on
plot(X2+100,Y2,"--b");
xlim([-50,180]);
ylim([-130,10]);
title("before optimization");
hold off
L=[0.202667968750000;
0.499704296874998;
0.723463281250003;
0.230087500000000;
1.30099765625002;
0.611535937499996;
];
[X1 Y1 X2 Y2]=cal_plot(L1,L2,L);
figure(2)
plot(X1+100,Y1,"-r");
hold on
plot(X2+100,Y2,"--b");
xlim([-50,180]);
ylim([-130,10]);
title("after optimization");
hold off
