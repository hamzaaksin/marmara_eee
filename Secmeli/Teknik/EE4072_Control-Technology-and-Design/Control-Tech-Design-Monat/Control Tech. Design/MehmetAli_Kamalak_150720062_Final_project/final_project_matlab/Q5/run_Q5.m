clear; close all; clc;

% ---- önce G_ts garanti olsun (bazen resetleniyor) ----
t = [0 2.5 5]';
G = [1000 400 1000]';
G_ts = timeseries(G,t);
assignin('base','G_ts',G_ts);

mdl = 'Q5_MPPT';     % senin model adı farklıysa burayı aynı yap
set_param(mdl,'StopTime','5');

% ---------- RUN 1: Adaptive P&O ----------
mppt_mode = 1;
assignin('base','mppt_mode',mppt_mode);
simOut1 = sim(mdl);

Vpv_PO  = simOut1.get('Vpv_ts');
Ipv_PO  = simOut1.get('Ipv_ts');
Ppv_PO  = simOut1.get('Ppv_ts');
Vdc_PO  = simOut1.get('Vdc_ts');
Vref_PO = simOut1.get('Vref_ts');
G_PO    = simOut1.get('Gout_ts');
aged_PO = simOut1.get('aged_ts');

save(fullfile('..','results','run_PO.mat'), ...
    'Vpv_PO','Ipv_PO','Ppv_PO','Vdc_PO','Vref_PO','G_PO','aged_PO');

% ---------- RUN 2: Incremental Conductance ----------
mppt_mode = 2;
assignin('base','mppt_mode',mppt_mode);
simOut2 = sim(mdl);

Vpv_InC  = simOut2.get('Vpv_ts');
Ipv_InC  = simOut2.get('Ipv_ts');
Ppv_InC  = simOut2.get('Ppv_ts');
Vdc_InC  = simOut2.get('Vdc_ts');
Vref_InC = simOut2.get('Vref_ts');
G_InC    = simOut2.get('Gout_ts');
aged_InC = simOut2.get('aged_ts');

save(fullfile('..','results','run_InC.mat'), ...
    'Vpv_InC','Ipv_InC','Ppv_InC','Vdc_InC','Vref_InC','G_InC','aged_InC');

% ---------- Theoretical Pmax reference ----------
tref = G_PO.Time;
Pmax = 50e3*(G_PO.Data/1000);     % basit teorik referans
k_age = 0.98;                    % yaşlanma etkisi için küçük düşüş
Pmax(aged_PO.Data < 0.5)  = Pmax(aged_PO.Data < 0.5);
Pmax(aged_PO.Data >= 0.5) = k_age*Pmax(aged_PO.Data >= 0.5);

% ---------- Plot: PV Power ----------
figure;
plot(Ppv_PO.Time,  Ppv_PO.Data,  'LineWidth', 1.2); hold on;
plot(Ppv_InC.Time, Ppv_InC.Data, 'LineWidth', 1.2);
plot(tref, Pmax, 'LineWidth', 1.2);
grid on;
xlabel('Time (s)'); ylabel('PV Power (W)');
legend('Adaptive P&O','InC','Theoretical Pmax','Location','best');
title('PV Power vs Time');

saveas(gcf, fullfile('..','results','PV_Power_Compare.png'));

% ---------- Plot: PV Voltage ----------
figure;
plot(Vpv_PO.Time,  Vpv_PO.Data,  'LineWidth', 1.2); hold on;
plot(Vpv_InC.Time, Vpv_InC.Data, 'LineWidth', 1.2);
grid on;
xlabel('Time (s)'); ylabel('PV Voltage (V)');
legend('Adaptive P&O','InC','Location','best');
title('PV Voltage vs Time');

saveas(gcf, fullfile('..','results','PV_Voltage_Compare.png'));
