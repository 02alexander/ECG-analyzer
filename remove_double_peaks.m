function new_peaks_indices = remove_double_peaks(peaks_indices, timestamps, ecg_data)

new_peaks_indices = [peaks_indices(1)];
for i = 2:numel(peaks_indices)
    %{
    if ( timestamps(peaks_indices(i))-timestamps(peaks_indices(i-1)) )/1000 > 0.2
        new_peaks_indices(end+1) = peaks_indices(i);
    end
    %}
    if (timestamps(peaks_indices(i))-timestamps(peaks_indices(i-1)))/1000 < 0.2
        %if ecg_data(peaks_indices(i)) > ecg_data(peaks_indices(i-1))
        %    new_peaks_indices(end) = peaks_indices(i);
        %end
        if sharpness(peaks_indices(i), ecg_data) > sharpness(peaks_indices(i-1), ecg_data)
            new_peaks_indices(end) = peaks_indices(i);
        end
    else
        new_peaks_indices(end+1) = peaks_indices(i);
    end
end
    
end

