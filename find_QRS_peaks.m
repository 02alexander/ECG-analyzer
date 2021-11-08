function peaks_indices = find_QRS_peaks(ecg_data, threshold) 
% hittar topparna av QRS komplexen.
% funkar bara om ecg_data har blivit "tillplattad" så att genomsnittliga
% signalstyrkan inte ökar. Detta kan göras genom att t.ex subtrahera med movmean.

maxv = max(ecg_data);
minv = min(ecg_data);

peaks_indices = [];

peaks = find(ecg_data/maxv > threshold)
consecutive_sequences = [];

i = 1;
while i < numel(peaks)
    
    start = i;
    while i+1 < numel(peaks) && peaks(i)+1 == peaks(i+1)
        i = i + 1;
    end
    %disp(["interval ", start, " ", i]);
    [m, idx] = max( ecg_data(peaks(start:i)) );
    %disp(m)

    if (min(ecg_data(peaks(i):peaks(i)+50)) < -0.7) 
        peaks_indices(end+1) = peaks(start)+idx-1;
    end
    i = i + 1;
    
end



end

