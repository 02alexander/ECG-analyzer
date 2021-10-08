function [pulse] = momentan_puls(ecg_data, sample_rate, n)

peaks_indices = find_QRS_peaks(ecg_data, 0.6)

pulse = [];
for i = n+1:numel(peaks_indices)
    timesteps = peaks_indices(i)-peaks_indices(i-n);
    pulse(end+1) = (timesteps/(n*sample_rate))*60;
end

end

