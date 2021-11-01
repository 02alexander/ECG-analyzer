
load oskardata.mat
load oxymeter_oskar.csv

%ecg_data = Shimmer_9DF2_ECG_LL_RA_24BIT_CAL-Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
%ecg_data = ecg_data-movmean(ecg_data,10000);
ecg_data = Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
%ecg_data = Shimmer_9DF2_ECG_LA_RA_24BIT_CAL;
ecg_data = ecg_data-movmean(ecg_data,1000);

%display(ecg_data)
%[pulse, peaks_indices] = momentan_puls(ecg_data, Shimmer_9DF2_TimestampSync_Unix_CAL, 0.35, 8);

peaks_indices = find_QRS_peaks(ecg_data, 0.4);
peaks_indices = remove_double_peaks(peaks_indices, Shimmer_9DF2_TimestampSync_Unix_CAL);

hold on
plot(ecg_data, "b");
plot(peaks_indices, ecg_data(peaks_indices), "r*");
xlim([0,10*512]);
