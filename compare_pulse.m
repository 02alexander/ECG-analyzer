
load oxymeter_oskar.csv
load oskardata.mat

ecg_data = Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
%ecg_data = Shimmer_9DF2_ECG_LA_RA_24BIT_CAL;
ecg_data = ecg_data-movmean(ecg_data,1000);

%display(ecg_data)
%[pulse, indices] = momentan_puls(ecg_data, Shimmer_9DF2_TimestampSync_Unix_CAL, 0.4, 2);
[pulse, indices] = pulse_time_window(ecg_data, Shimmer_9DF2_TimestampSync_Unix_CAL, 0.4, 15);

hold on
plot((0:60)*10*512, oxymeter_oskar(:,2), "b");
plot(indices, pulse, "r");
xlim([0,600*512]);
grid on