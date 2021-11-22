function peaks_indices = find_QRS_peaks(ecg_data, threshold) 
% hittar topparna av QRS komplexen.
% funkar bara om ecg_data har blivit "tillplattad" så att genomsnittliga
% signalstyrkan inte ökar. Detta kan göras genom att t.ex subtrahera med movmean.

peaks_indices = [];

peaks = find(ecg_data > threshold);

i = 1;
while i < numel(peaks)
    
    start = i;
    while i+1 < numel(peaks) && peaks(i)+1 == peaks(i+1)
        i = i + 1;
    end
    [m, idx] = max( ecg_data(peaks(start:i)) );

    ed = min([peaks(start)+idx-1+30, numel(ecg_data)]);
    st = max([peaks(start)+idx-1-20, 1]);


    if (ed >= peaks(i)) && ((m - min(ecg_data(peaks(i):ed))) > 0.4) ... 
            && ((m-min(ecg_data(st:peaks(start)+idx-1 ))) > 0.2) ...
            && min(ecg_data(peaks(i):ed)) < -0.2
        peaks_indices(end+1) = peaks(start)+idx-1;
    end
    i = i + 1;
    
end



end

