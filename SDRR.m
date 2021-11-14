function sdrr = SDRR(ecg_data, timestamps, freq)


peaks_indices = find_QRS_peaks(ecg_data, 0.15);
peaks_indices = remove_double_peaks(peaks_indices, timestamps);

sdrr = [];

for i=2:numel(peaks_indices)
    %start = max(1, i-60*freq);
    for j=i:-1:1
        s = ( timestamps(peaks_indices(i))-timestamps(peaks_indices(j)) )/1000;
        if s > 60
            j = max(1, j-1);
            break
        end
    end
    t = timestamps(peaks_indices(j:i))/1000;
    rr_intervals = t(2:end)-t(1:end-1)
    sdrr(end+1) = std(rr_intervals);
end
%rr_intervals = pt(2:end)-pt(1:end-1)
%sdrr = std(rr_intervals)

end