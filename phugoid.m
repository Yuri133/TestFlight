run("statespace_symmetric.m");
load("matlab.mat");
t = flightdata.time.data;
sampling_rate = 1/(t(2)-t(1));
t_start = 31840;
t_end = 34550;
t = t(t_start:t_end)-t_start/10;

V_0 = flightdata.Dadc1_tas.data(t_start);
alpha_0 = flightdata.vane_AOA.data(t_start);
elev_0 = flightdata.delta_e.data(t_start);
q_0 = flightdata.Ahrs1_bPitchRate.data(t_start);
hp = flightdata.Dadc1_alt.data(t_start);


input = flightdata.delta_e.data(t_start:t_end)-elev_0;
input = input/180*pi;
tas = flightdata.Dadc1_tas.data(t_start:t_end)-V_0;
aoa = flightdata.vane_AOA.data(t_start:t_end)-alpha_0;
q = flightdata.Ahrs1_bPitchRate.data(t_start:t_end)-q_0;


y = lsim(symmetric, input, t);
plot(t, y(:,1), t, tas);
legend("Simulation", "Real flight");
plot(t, y(:,2), t, aoa);
legend("Simulation", "Real flight");
% plot(t, y(:,4), t, q);
% legend("Simulation", "Real flight");
