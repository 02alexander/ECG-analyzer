%load fys_ruben.mat
load fys_oskar.mat

n = 1000
step = 3

VXRL = Shimmer_9DF2_ECG_Vx_RL_24BIT_CAL;
VXRL = VXRL - movmean(VXRL,n);

LLRA = Shimmer_9DF2_ECG_LL_RA_24BIT_CAL;
LLRA = LLRA - movmean(LLRA, n) + step;

LLLA = Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
LLLA = LLLA - movmean(LLLA, n) + step*2;

LARA = Shimmer_9DF2_ECG_LA_RA_24BIT_CAL;
LARA = LARA - movmean(LARA, n) + step*3;

hold on
plot(VXRL, 'b')
plot(LLRA, 'r')
plot(LLLA, 'g')
plot(LARA, 'y')
xlim([1 5000])

