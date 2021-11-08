function new_peaks_indices = remove_double_peaks(peaks_indices, timestamps)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

new_peaks_indices = [peaks_indices(1)];
for i = 2:numel(peaks_indices)
    if ( timestamps(peaks_indices(i))-timestamps(peaks_indices(i-1)) )/1000 > 0.2
        new_peaks_indices(end+1) = peaks_indices(i);
    end
end
    
end

