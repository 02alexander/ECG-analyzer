function [pulse, indices] = momentan_puls(ecg_data, time_stamps, threshold, n)

%display(ecg_data)
peaks_indices = find_QRS_peaks(ecg_data, threshold);
peaks_indices = remove_double_peaks(peaks_indices, time_stamps, ecg_data);

pulse = [];
indices = [];


for i = n+1:numel(peaks_indices)
    timediff = (time_stamps(peaks_indices(i))-time_stamps(peaks_indices(i-n)))/1000;
    %timediff = (1/1000)*median(time_stamps(peaks_indices(i):peaks_indices(i)-n+1)-time_stamps(peaks_indices(i)-1:peaks_indices(i)-n))
    
    pulse(end+1) = 60/(timediff/n);
    indices(end+1) = peaks_indices(i);
end

end

