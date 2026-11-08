function export_Q4_figs(outVar, tag)
% outVar: out_setpoint veya out_disturb (Simulink.SimulationOutput)
% tag  : 'setpoint' veya 'disturb'

% Verileri çek (senin değişken adların)
y_ts    = outVar.y_ts;
That_ts = outVar.That_ts;
dhat_ts = outVar.dhat_ts;
u_ts    = outVar.u_ts;

% Klasör
figdir = fullfile(pwd,'figs_Q4');
if ~exist(figdir,'dir'), mkdir(figdir); end

% MATLAB gibi görünüm
set(0,'DefaultLegendInterpreter','none');
set(0,'DefaultTextInterpreter','none');

% 1) Temperature
f1 = figure(1); clf;
plot(y_ts.Time, y_ts.Data); hold on;
plot(That_ts.Time, That_ts.Data);
grid on; xlabel('Time (s)'); ylabel('Temperature (C)');
legend('Measured y','Estimated That','Location','northeast');
set(f1,'Color','w');
exportgraphics(f1, fullfile(figdir, ['Q4_' tag '_T.png']), 'Resolution', 200);

% 2) dhat
f2 = figure(2); clf;
plot(dhat_ts.Time, dhat_ts.Data);
grid on; xlabel('Time (s)'); ylabel('Estimated disturbance dhat');
set(f2,'Color','w');
exportgraphics(f2, fullfile(figdir, ['Q4_' tag '_dhat.png']), 'Resolution', 200);

% 3) u
f3 = figure(3); clf;
plot(u_ts.Time, u_ts.Data);
grid on; xlabel('Time (s)'); ylabel('Heater power u (W)');
set(f3,'Color','w');
exportgraphics(f3, fullfile(figdir, ['Q4_' tag '_u.png']), 'Resolution', 200);

disp("Saved figures to: " + figdir);
end
