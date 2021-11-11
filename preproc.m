function ecg_data = preproc(raw_ecg_data)

ecg_data = raw_ecg_data-movmean(raw_ecg_data, 1000);
ecg_data = scale_ecg(ecg_data, 2000);

ecg_data = bandpass(ecg_data, [ 0.3 0.6], 512);
%ecg_data = lowpass(ecg_data, 0.5, 512);

end