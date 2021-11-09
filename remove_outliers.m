function new_pulse = remove_outliers(pulse)

new_pulse = pulse;

threshold = 0.35;

ma = movmean(pulse, 10);

for i = 1:numel(pulse)
    if abs(pulse(i)/ma(i)-1) > 0.3
        new_pulse(i) = ma(i);
    else
        new_pulse(i) = pulse(i);
    end
    
end

new_pulse;

end