%load fys_ruben.mat

S = load("fys_oskar.mat");

timestamps = load_ecg_var("TimestampSync", S);
freq = get_freq(timestamps);

VXRL = load_ecg_var("Vx_RL", S);
%VXRL = Shimmer_9DF2_ECG_Vx_RL_24BIT_CAL;
%VXRL(1:10)
VXRL = preproc(VXRL, freq);

LLRA = load_ecg_var("LL_RA", S);
%LLRA = Shimmer_9DF2_ECG_LL_RA_24BIT_CAL;
LLRA = preproc(LLRA, freq) + step;

LLLA = load_ecg_var("LL_LA", S);
%LLLA = Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
LLLA = preproc(LLRA, freq) + step*2;

%LLLA = lowpass(LLLA, 0.5);

LARA = load_ecg_var("LA_RA", S);
%LARA = Shimmer_9DF2_ECG_LA_RA_24BIT_CAL;
LARA = preproc(LARA, freq) + step*3;

%lp = lowpass(LLLA, 0.1, 512) + step;
%lp = bandpass(LLLA, [0.3 3], 512) + step;
%lp = preproc(LLLA);

t = (timestamps-timestamps(1))/1000;

hold on
plot(t, VXRL, 'b')
plot(t, LLRA, 'r')
plot(t, LLLA, 'g')
plot(t, LARA, 'y')
%plot(lp, 'b')
xlim([1 10])
hold off

