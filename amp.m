function amp = amp(ecg_data, freq)

mmx = movmax(ecg_data, freq*2);
mmn = movmin(ecg_data, freq*2);
amp = mean(mmx)-mean(mmn);

end