function peaks_indices = find_QRS_peaks(ecg_data, threshold) 
% hittar topparna av QRS komplexen.
% funkar bara om ecg_data har blivit "tillplattad" så att genomsnittliga
% signalstyrkan inte ökar. Detta kan göras genom att t.ex subtrahera med movmean.

%maxv = max(ecg_data);
%minv = min(ecg_data);
%dv = maxv-minv

peaks_indices = [];

peaks = find(ecg_data > threshold);
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

    ed = min([peaks(start)+idx-1+30, numel(ecg_data)]);
    %ed = min([peaks(i)+30, numel(ecg_data)]);
    if ( (m - min(ecg_data(peaks(i):ed))) > 1.0) 
        peaks_indices(end+1) = peaks(start)+idx-1;
    end
    i = i + 1;
    
end



end

