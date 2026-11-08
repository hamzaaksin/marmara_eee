%% Q1c - IM V/f: Torque-Speed sweep (TL sweep) 
clear; clc;

model = "Q1c_VF_PI";   
load_system(model);

%% Sim ayarları
stopTime     = 5;      % s
steadyWindow = 0.8;    % son 0.8 s ortalama
set_param(model, "StopTime", num2str(stopTime));

%% Yük torku sweep (N*m)
TL_list = 0:0.5:10;

wm_ss = nan(size(TL_list));   % rad/s
Te_ss = nan(size(TL_list));   % N*m
mws = get_param(model,'ModelWorkspace');

for k = 1:numel(TL_list)
    TL = TL_list(k);

    simIn = Simulink.SimulationInput(model);
    simIn = simIn.setVariable("TL", TL);
assignin(mws,'TL',TL);   

    try
        simOut = sim(simIn);

        % Sinyalleri al (wm_out / Te_out) 
        wm_ts = fetchTS(simOut, "wm_out");
        Te_ts = fetchTS(simOut, "Te_out");

        t = wm_ts.Time;
        idx = t >= (t(end) - steadyWindow);

        wm_ss(k) = mean(wm_ts.Data(idx));
        Te_ss(k) = mean(Te_ts.Data(idx));

        fprintf("TL=%5.1f -> wm_ss=%8.2f rad/s, Te_ss=%8.2f N*m\n", ...
            TL, wm_ss(k), Te_ss(k));

    catch ME
        fprintf("TL=%5.1f -> SIM HATA/STALL olabilir: %s\n", TL, ME.message);
        wm_ss(k) = NaN;
        Te_ss(k) = NaN;
    end
end

%% NaN temizle
ok = ~isnan(wm_ss) & ~isnan(Te_ss);
wm_ss = wm_ss(ok);
Te_ss = Te_ss(ok);

%%
if ~isempty(Te_ss) && median(Te_ss) < 0
    Te_ss = -Te_ss;
    fprintf("\n[INFO] Te işareti ters göründüğü için otomatik olarak -1 ile çevrildi.\n\n");
end

%% rpm dönüşümü
wm_rpm = wm_ss * 60/(2*pi);

%% Grafikler
figure;
plot(wm_ss, Te_ss, "o-");
grid on;
xlabel("Rotor speed wm (rad/s)");
ylabel("Electromagnetic torque Te (N*m)");
title("Q1c: Torque-Speed (steady-state) - TL sweep");

figure;
plot(wm_rpm, Te_ss, "o-");
grid on;
xlabel("Speed (rpm)");
ylabel("Te (N*m)");
title("Q1c: Torque-Speed (rpm)");

%% --- Starting / Rated / Breakdown noktalarını bul ve işaretle ---

% Breakdown (maks tork)
[Te_bd, i_bd] = max(Te_ss);
wm_bd  = wm_ss(i_bd);
rpm_bd = wm_rpm(i_bd);

% Starting'e en yakın (en düşük hız noktası)
[~, i0] = min(wm_ss);

% Rated'e yakın
rpm_rated_target = 1450;   
[~, ir] = min(abs(wm_rpm - rpm_rated_target));

% Command Window'a yazdır
fprintf("\nSTARTING~:  Te = %.3f N*m @ wm = %.2f rad/s (%.1f rpm)\n", Te_ss(i0), wm_ss(i0), wm_rpm(i0));
fprintf("RATED~:     Te = %.3f N*m @ wm = %.2f rad/s (%.1f rpm)\n", Te_ss(ir), wm_ss(ir), wm_rpm(ir));
fprintf("BREAKDOWN:  Te = %.3f N*m @ wm = %.2f rad/s (%.1f rpm)\n\n", Te_bd, wm_bd, rpm_bd);

% rpm grafiğine işaret koy 
figure(gcf); hold on;
plot(wm_rpm(i0),  Te_ss(i0),  'rs', 'MarkerSize', 8,  'LineWidth', 2);
plot(wm_rpm(ir),  Te_ss(ir),  'gd', 'MarkerSize', 8,  'LineWidth', 2);
plot(wm_rpm(i_bd),Te_ss(i_bd),'kp', 'MarkerSize', 10, 'LineWidth', 2);
legend('T-S curve','Starting~','Rated~','Breakdown','Location','best');
hold off;


%% Breakdown torque (maks tork)
if ~isempty(Te_ss)
    [Te_bd, i_bd] = max(Te_ss);
    fprintf("Breakdown torque = %.3f N*m @ wm = %.2f rad/s (%.1f rpm)\n", ...
        Te_bd, wm_ss(i_bd), wm_rpm(i_bd));
end

%% -------------------- LOCAL FUNCTIONS --------------------
function ts = fetchTS(simOut, fieldname)
    % 1) SimOut içinde direkt var mı?
    if hasVar(simOut, fieldname)
        v = simOut.get(fieldname);
        ts = toTimeseries(v, fieldname);
        return;
    end

    % 2) SimOut içinde "out" struct var mı?
    if hasVar(simOut, "out")
        outS = simOut.get("out");
        if isstruct(outS) && isfield(outS, fieldname)
            v = outS.(fieldname);
            ts = toTimeseries(v, fieldname);
            return;
        end
    end

    error("'%s' bulunamadı. To Workspace isimlerini kontrol et (wm_out / Te_out).", fieldname);
end

function tf = hasVar(simOut, varname)
    tf = false;
    try
        simOut.get(varname);
        tf = true;
    catch
        tf = false;
    end
end

function ts = toTimeseries(v, fieldname)
    if isa(v, "timeseries")
        ts = v;
    elseif isstruct(v) && isfield(v,"time") && isfield(v,"signals") ...
            && isfield(v.signals, "values")
        ts = timeseries(v.signals.values, v.time);
    else
        error("'%s' timeseries/struct formatında değil. To Workspace 'Save format' = Timeseries yap.", fieldname);
    end
end

