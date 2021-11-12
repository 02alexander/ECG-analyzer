%load fys_ruben.mat

load fys_oskar.mat

n = 1000
step = 3

VXRL = Shimmer_9DF2_ECG_Vx_RL_24BIT_CAL;
VXRL = preproc(VXRL);

LLRA = Shimmer_9DF2_ECG_LL_RA_24BIT_CAL;
LLRA = preproc(LLRA) + step;

LLLA = Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
LLLA = preproc(LLRA) + step*2;

%LLLA = lowpass(LLLA, 0.5);

LARA = Shimmer_9DF2_ECG_LA_RA_24BIT_CAL;
LARA = preproc(LARA) + step*3;

%lp = lowpass(LLLA, 0.1, 512) + step;
%lp = bandpass(LLLA, [0.3 3], 512) + step;
%lp = preproc(LLLA);

hold on
plot(VXRL, 'b')
plot(LLRA, 'r')
plot(LLLA, 'g')
plot(LARA, 'y')
%plot(lp, 'b')
xlim([1 5000])
hold off

