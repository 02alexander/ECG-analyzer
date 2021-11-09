function scaled_ecg_data = scale_ecg(ecg_data,n)

mmx = movmax(ecg_data, n);
mmn = movmin(ecg_data, n);

scaled_ecg_data = ecg_data;

for i = 1:numel(ecg_data)
    if ecg_data(i) > 0
        scaled_ecg_data(i) = ecg_data(i)/abs(mmx(i));
    else
        scaled_ecg_data(i) = ecg_data(i)/abs(mmn(i));
    end
end

end