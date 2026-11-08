model = 'Q1a_IM_openloop';   

torques = 0:5:120;
wm_ss = zeros(size(torques));
Te_ss = zeros(size(torques));

for k = 1:numel(torques)
    TL = torques(k);
    out = sim(model);

    wm = out.wm_out;  
    Te = out.Te_out;  

    n = numel(wm.Data);
    idx0 = max(1, round(0.8*n));

    wm_ss(k) = mean(wm.Data(idx0:end));
    Te_ss(k) = mean(Te.Data(idx0:end));
end

rpm_ss = wm_ss * 60/(2*pi);

figure; plot(Te_ss, rpm_ss, 'LineWidth', 1.5); grid on;
xlabel('Te (N·m)'); ylabel('Speed (rpm)');
title('IM Speed–Torque (Open-loop)');

[Te_max, i_max] = max(Te_ss);
hold on; plot(Te_max, rpm_ss(i_max), 'o', 'LineWidth', 2);
text(Te_max, rpm_ss(i_max), sprintf('  Breakdown ~ %.1f N·m', Te_max));
