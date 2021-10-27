
load oxymeter_oskar.csv
load oskardata.mat

ecg_data = Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
%ecg_data = Shimmer_9DF2_ECG_LA_RA_24BIT_CAL;
ecg_data = ecg_data-movmean(ecg_data,1000);

%display(ecg_data)
[pulse, indices] = momentan_puls(ecg_data, Shimmer_9DF2_TimestampSync_Unix_CAL, 0.6, 12);


hold on
plot((0:60)*10, oxymeter_oskar(:,2), "b");
plot(indices/512, pulse, "r");
xlim([0,600]);
grid on