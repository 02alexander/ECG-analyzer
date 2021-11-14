function f = get_freq(timestamps)

d = (timestamps(end)-timestamps(1))/(numel(timestamps)*1000);
f = 1/d;

end