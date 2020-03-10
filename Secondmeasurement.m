clear all;
close all;
clc;
Cmdelta = -0.1293;




data = [5.3	0	2.8;
6.3	-0.4	2.8;
7.3	-0.9	2.8;
8.5	-1.5	2.8;
4.5	0.4	2.8;
4.1	0.6	2.8;
3.4	1	2.8];



X = transpose(Delta_alpha(:,1));
Y = transpose(Delta_alpha(:,2));
format long;
[r,m,b] = regression(X,Y);
xlabel = ("alpha");
plotregression(X,Y);
Cmalpha = -Cmdelta*m