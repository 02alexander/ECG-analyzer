function peaks_indices = find_QRS_peaks(ecg_data, threshold) 
% hittar topparna av QRS komplexen.
% funkar bara om ecg_data har blivit "tillplattad" så att genomsnittliga
% signalstyrkan inte ökar. Detta kan göras genom att t.ex subtrahera med movmean.

peaks_indices = []

peaks = find(ecg_data > threshold)
consecutive_sequences = [];

i = 1;
while i < numel(peaks)
    
    start = i;
    while i+1 < numel(peaks) && peaks(i)+1 == peaks(i+1)
        i = i + 1;
    end
    %disp(["interval ", start, " ", i]);
    [m, idx] = max( ecg_data(peaks(start:i)) );
    disp(m)
    peaks_indices(end+1) = peaks(start)+idx-1;
    i = i + 1;
    
end


end

