clear all;
close all;
clc;
%load("f_cg.m")
Cmdelta = -0.1293;


timet = [2239,2351,2484,2576,2741,2840,2920]
%W

%hp,IAS,a,de,detr,Fe,FFl,FFr,Fused,TAT
data = [6060	161	5.3	0	2.8	0	462	486	664	5.5;
6350	150	6.3	-0.4	2.8	-23	458	482	694	4.5;
6550	140	7.3	-0.9	2.8	-29	454	477	730	3.5;
6880	130	8.5	-1.5	2.8	-46	449	473	755	2.5;
6160	173	4.5	0.4	2.8	26	465	489	798	5.0;
5810	179	4.1	0.6	2.8	40	472	496	825	6.2;
5310	192	3.4	1	2.8	83	482	505	846	8.2];




X = transpose(Delta_alpha(:,1));
Y = transpose(Delta_alpha(:,2));
format long;
[r,m,b] = regression(X,Y);
xlabel = ("alpha");
plotregression(X,Y);
Cmalpha = -Cmdelta*m