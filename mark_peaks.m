
S = load("EKG_Kvinna_Fysisk_Aktivitet.mat");
ecg_data = load_ecg_var("LL_RA", S);

timestamps = load_ecg_var("TimestampSync", S);
freq = get_freq(timestamps);
ecg_data = preproc(ecg_data, freq);

peaks_indices = find_QRS_peaks(ecg_data, 0.15);
peaks_indices = remove_double_peaks(peaks_indices, timestamps, ecg_data);

timestamps = timestamps - timestamps(1);
timestamps = timestamps/1000;
hold on
plot(timestamps, ecg_data, "b");
plot(timestamps(peaks_indices), ecg_data(peaks_indices), "r*");

xlim([timestamps(1) timestamps(5*512)]);
