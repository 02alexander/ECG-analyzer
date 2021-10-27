%% Program that loads and plots shimmer ECG data
[file, path] = uigetfile('*.mat', 'Select Shimmer ECG file');
shimmer_data = matfile([path, file]);

tmp_idx = strfind(file, 'Shimmer_');
%shimmer_name = file(tmp_idx+[0:11]);
shimmer_name = "9DF2";

ecg_data = [];
ecg_data_name = [];
ecg_data_shortname = [];
accel_data = [];
accel_data_name = [];
accel_data_shortname = [];
ecg_data_found = false;
accel_data_found = false;
time_data_found = false;
for varname = fieldnames(shimmer_data)' %iterate over the variable
    if ~isempty(strfind(varname{1}, '_ECG_L'))
        ecg_data_found = true;
        ecg_data = [ecg_data, shimmer_data.(varname{1})];
        ecg_data_name = [ecg_data_name, convertCharsToStrings(varname{1})];
        tmp_idx = strfind(varname{1}, '_ECG_L');
        ecg_data_shortname = [ecg_data_shortname, convertCharsToStrings(varname{1}(tmp_idx+[1:9]))];
    end
    if ~isempty(strfind(varname{1}, '_Accel_'))
        accel_data_found = true;
        accel_data = [accel_data, shimmer_data.(varname{1})];
        accel_data_name = [accel_data_name, convertCharsToStrings(varname{1})];
        tmp_idx = strfind(varname{1}, '_Accel_');
        accel_data_shortname = [accel_data_shortname, convertCharsToStrings(varname{1}(tmp_idx+[1:10]))];
    end
    if ~isempty(strfind(varname{1}, '_Timestamp'))
        time_data_found = true;
        time_data = shimmer_data.(varname{1});
        time_data = (time_data - time_data(1))/1000;
        Fs = 1/median(diff(time_data));
    end
end

if time_data_found == false
    disp('No time-data found')
else
    if accel_data_found == false
        disp('No accelerometer-data found')
    else
        figure
        plot(time_data, accel_data)
        set(gca, 'xlim', [min(time_data), max(time_data)])
        title(['Accelerometer - ', shimmer_name], 'interpreter', 'none')
        xlabel('Time [s]')
        ylabel('Acceleration [m/s^2]')
        legend(accel_data_shortname, 'location', 'best', 'interpreter', 'none')
    end
    if ecg_data_found == false
        disp('No ecg-data found')
    else
        % Remove average and plot all ECG signals with an offset.
        figure
        ecg_offset_in_plots = max(prctile(ecg_data, 99.9) - prctile(ecg_data, 0.1));
        y2plot = ecg_data - mean(ecg_data,1) + [0:size(ecg_data,2)-1]*ecg_offset_in_plots; % Removes the average and adds an offset to separate the ECG signals in the plot.
        plot(time_data, y2plot)
        tmp_ylim = [prctile(y2plot(:), 0.1), prctile(y2plot(:), 99.9)];
        tmp_ylim = diff(tmp_ylim)*[-1 1]*0.1 + tmp_ylim;
        set(gca, 'ylim', tmp_ylim, 'xlim', [min(time_data), max(time_data)])
        title(['ECG - ', shimmer_name], 'interpreter', 'none')
        xlabel('Time [s]')
        ylabel('ECG voltage [mV]')
        legend(ecg_data_shortname, 'location', 'best', 'interpreter', 'none')
        zoom
    end
end