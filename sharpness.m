function v = sharpness(idx,ecg_data)
% ju högre värde på v desto skarpare är toppen idx

for i = idx:numel(ecg_data)
    if ecg_data(idx)-ecg_data(i) > 0.2
        break
    end
end

for j = idx:-1:1
    if ecg_data(idx)-ecg_data(i) > 0.2
        break
    end
end

v = -((i-idx)+(idx-j));

end