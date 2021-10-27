
load ecg_example


interval = 1:1000;

hz = 250;
[r,c] = size(ecg_data);
t = (1:r)/hz;

plot(t(interval), ecg_data(interval));
xlabel("seconds")
grid on;