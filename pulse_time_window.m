function [pulse, indices] = pulse_time_window(ecg_data,time_stamps, threshold, t)


peaks_indices = find_QRS_peaks(ecg_data, threshold);
peaks_indices = remove_double_peaks(peaks_indices, time_stamps);

pulse = [];
indices = [];

 %{
for i = 2:n
    timediff = (time_stamps(peaks_indices(i))-time_stamps(peaks_indices(1)))/1000;
    %timediff = (1/1000)*median(time_stamps(peaks_indices(i):peaks_indices(i)-n+1)-time_stamps(peaks_indices(i)-1:peaks_indices(i)-n))
    
    pulse(end+1) = 60/(timediff/(i-1));
    indices(end+1) = peaks_indices(i);
end
%}

for i = 1:numel(peaks_indices)
    
    cur_time = time_stamps(peaks_indices(i));
    
    v = [];
    for j = flip(1:i-1)
        pt = time_stamps(peaks_indices(j));
        if abs(pt-cur_time) > 1000*t
            break
        else
            v(end+1) = peaks_indices(j);
        end
    end
    
    if size(v) == 0
        continue
    end
    
    timediff = (cur_time-time_stamps(v(end)))/1000;
    %timediff = (time_stamps(peaks_indices(i))-time_stamps(peaks_indices(i-n)))/1000;
    %timediff = (1/1000)*median(time_stamps(peaks_indices(i):peaks_indices(i)-n+1)-time_stamps(peaks_indices(i)-1:peaks_indices(i)-n))
    
    pulse(end+1) = 60/(timediff/numel(v));
    indices(end+1) = peaks_indices(i);
end

end

