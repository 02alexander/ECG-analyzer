function sdrr = SDRR(ecg_data, timestamps)

peaks_indices = find_QRS_peaks(ecg_data, threshold);
peaks_indices = remove_double_peaks(peaks_indices, time_stamps);

pt = timestamps(peaks_indices)
rr_intervals = pt(2:end)-pt(1:end-1)
sdrr = std(rr_intervals)

end