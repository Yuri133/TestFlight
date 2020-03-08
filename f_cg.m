%inputs in pounds unless other unit is stated behind it

pounds_seat1 = 150;
pounds_seat2 = 150;
pounds_seat3 = 150;
pounds_seat4 = 150;
pounds_seat5 = 150;
pounds_seat6 = 150;
pounds_seat7 = 150;
pounds_seat8 = 150;
pounds_seat10 = 150;
pounds_nose = 40;
pounds_aft1 = 20;
pounds_aft2 = 30;
pounds_FuelStart = 1;

%seats contain 9x2 matrix with [x_cg_fromfront[inches],mass[pounds]] per
%seat
seats = [131 pounds_seat1; 131 pounds_seat2; 214 pounds_seat3; 214 pounds_seat4; 251 pounds_seat5; 251 pounds_seat6; 288 pounds_seat7; 288 pounds_seat8; 170 pounds_seat10];

baggage = [74 pounds_nose; 321 pounds_aft1; 338 pounds_aft2];

A_payload = [seats;baggage];

pounds_payload = sum(A_payload(:,2));

BEM = [9165.0 291.65];      % [pounds inches]

pounds_ZFM = pounds_payload + BEM(1,1);





function [W] = W(t,pounds_ZFM,pounds_FuelStart)

%This function calculates W(t1) = ramp mass - int_0^t1(fuelflow * dt) 
%The answer is in kg
F_used = 0;                                      %needs to look at time in 
%measurement data and give F_used for that t --> FTIS
W_lbm = pounds_ZFM + pounds_FuelStart - F_used;
W = convmass(W_lbm,'lbm','kg');
end



%function [x_cg] = cg(t,payload,BEM,FuelStart);