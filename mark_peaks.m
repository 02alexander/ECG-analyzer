
S = load("fys_oskar.mat");
%load fys_ruben.mat
%load oskardata.mat
%load oxymeter_oskar.csv

%ecg_data = Shimmer_9DF2_ECG_LL_RA_24BIT_CAL-Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
%ecg_data = ecg_data-movmean(ecg_data,10000);
%ecg_data = Shimmer_9DF2_ECG_LL_LA_24BIT_CAL;
ecg_data = load_ecg_var("LL_RA", S);
%ecg_data = Shimmer_9DF2_ECG_Vx_RL_24BIT_CAL;

timestamps = load_ecg_var("TimestampSync", S);

ecg_data = preproc(ecg_data);

%ecg_data = ecg_data(1:5000)

%display(ecg_data)
%[pulse, peaks_indices] = momentan_puls(ecg_data, Shimmer_9DF2_TimestampSync_Unix_CAL, 0.35, 8);

peaks_indices = find_QRS_peaks(ecg_data, 0.15);
peaks_indices = remove_double_peaks(peaks_indices, timestamps);

timestamps = timestamps - timestamps(1);
timestamps = timestamps/1000;
hold on
plot(timestamps, ecg_data, "b");
plot(timestamps(peaks_indices), ecg_data(peaks_indices), "r*");

xlim([timestamps(1) timestamps(5*512)]);
