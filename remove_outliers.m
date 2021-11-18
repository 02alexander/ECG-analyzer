function new_pulse = remove_outliers(pulse, threshold)

new_pulse = pulse;


ma = movmean(pulse, 30);

for i = 1:numel(pulse)
    if abs(pulse(i)/ma(i)-1) > threshold
        new_pulse(i) = ma(i);
    else
        new_pulse(i) = pulse(i);
    end
    
end

new_pulse;

end