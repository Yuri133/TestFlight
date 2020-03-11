run("statespace_symmetric.m");
load("matlab.mat");
t = flightdata.time.data;
sampling_rate = 1/(t(2)-t(1));
t_start = 31840+330;
t_end = 34450;
t = t(t_start:t_end)-t_start/10;

hp = flightdata.Dadc1_alt.data(t_start);


V_0 = flightdata.Dadc1_tas.data(t_start);
alpha_0 = flightdata.vane_AOA.data(t_start);
elev_0 = flightdata.delta_e.data(t_start);
q_0 = flightdata.Ahrs1_bPitchRate.data(t_start);
th_0 = flightdata.Ahrs1_Pitch.data(t_start);


input = flightdata.delta_e.data(t_start:t_end)-elev_0;
input = input/180*pi;
tas = flightdata.Dadc1_tas.data(t_start:t_end)-V_0;
aoa = flightdata.vane_AOA.data(t_start:t_end)-alpha_0;
q = flightdata.Ahrs1_bPitchRate.data(t_start:t_end)-q_0;
th = flightdata.Ahrs1_Pitch.data(t_start:t_end)-th_0;

tiledlayout(4,1)

y = lsim(symmetric, input, t);
nexttile
plot(t, y(:,1), t, tas);
legend("Simulation", "Real flight");
title("Speed deviation");
nexttile
plot(t, y(:,2), t, aoa);
legend("Simulation", "Real flight");
title("Angle of attack deviation");
nexttile
plot(t, y(:,3), t, th);
legend("Simulation", "Real flight");
title("Pitch deviation");
nexttile
plot(t, y(:,4), t, q);
legend("Simulation", "Real flight");
title("Pitch rate deviation");
