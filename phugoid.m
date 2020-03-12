run("statespace_symmetric.m");
load("matlab.mat");


aoa = flightdata.vane_AOA.data;
t = flightdata.time.data;
sampling_rate = 1/(t(2)-t(1));
t_start = 31854;
t_end = 34450;
t = t(t_start:t_end)-t(t_start);

hp = flightdata.Dadc1_alt.data(t_start)


V_0 = flightdata.Dadc1_cas.data(t_start)
alpha_0 = aoa(t_start);
elev_0 = flightdata.delta_e.data(t_start);
q_0 = flightdata.Ahrs1_bPitchRate.data(t_start);
th_0 = flightdata.Ahrs1_Pitch.data(t_start);


input = flightdata.delta_e.data(t_start:t_end)-elev_0;
input = input/180*pi;
tas = flightdata.Dadc1_cas.data(t_start:t_end)-V_0;
aoa =aoa(t_start:t_end)-alpha_0;
q = flightdata.Ahrs1_bPitchRate.data(t_start:t_end)-q_0;
th = flightdata.Ahrs1_Pitch.data(t_start:t_end)-th_0;

y = lsim(symmetric, input, t);

t_start_tas = 40*10;
tas_num = y(t_start_tas:end, 1);
tas_rea = tas(t_start_tas:end);
t_sim = t(t_start_tas:end);


tiledlayout(2,2);
% nexttile
% plot(t, input/pi*180);
% title("Elevator deflection from trim trimmed position");
% ylabel("[deg]");
% xlabel("[s]");
nexttile
plot(t, y(:,1), t, tas);
legend("Simulation", "Real flight");
title("Speed deviation");
ylabel("[m/s]");
xlabel("[s]");
nexttile
plot(t, y(:,2), t, aoa);
legend("Simulation", "Real flight");
title("Angle of attack deviation");
ylabel("[deg]");
xlabel("[s]");
nexttile
plot(t, y(:,3), t, th);
legend("Simulation", "Real flight");
title("Pitch deviation");
ylabel("[deg]");
xlabel("[s]");
nexttile
plot(t, y(:,4), t, q);
legend("Simulation", "Real flight");
title("Pitch rate deviation");
ylabel("[deg/s]");
xlabel("[s]");
