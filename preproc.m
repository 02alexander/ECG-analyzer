function ecg_data = preproc(ecg_data, freq)

ecg_data = ecg_data-movmean(ecg_data, freq/2);
%ecg_data = bandpass(ecg_data, [ 0.1 5], 512);
ecg_data = lowpass(ecg_data, 0.5, freq);
ecg_data = ecg_data/amp(ecg_data, freq);

end