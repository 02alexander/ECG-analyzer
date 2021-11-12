function var = load_ecg_var(var_name, S)
% givet en ledning ger load_ecg_var tillbaka motsvarande variabel i S
% t.ex load_ecg_var("LL_LA", load("fys_oskar.mat"))
% Denna funktion behövs eftersom början av variabelnamnet ändras mellan
% mätningar, t.ex i ena filen börjar alla variabler med Shimmer_9Df2_...
% och i en annan Shimmer_9F2C_...

cell = struct2cell(S);
fields = fieldnames(S);


for i = 1:numel(fields)
    s = split(fields(i), '_');
    
    if s(3) == "TimestampSync" && var_name == "TimestampSync"
        var = cell2mat(cell(i));
        break
    end

    if s(3) == "ECG"
        if s(4)+"_"+s(5) == var_name
            var = cell2mat(cell(i));
            break
        end
    end
end


end