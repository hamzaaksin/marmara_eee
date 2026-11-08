% Given parameters
lc = 0.157;       % Length of the toroid in meters
Ac = 0.0007;      % Cross-sectional area of the core in square meters
N = 100;          % Number of turns
Vpeak = 100;      % Peak voltage in volts
f = 100;          % Frequency in Hz
B_saturation = 1.35;  % Saturation point in teslas
% Magnetization curve data
H = [0 100 200 300 400 500 600 700 800 900 1000];  % Magnetic field (A/m)
B = [0 0.65 1 1.1 1.2 1.25 1.27 1.3 1.32 1.34 1.35];  % Flux density (T)

% Calculate the peak magnetic field (H_peak) and peak magnetic flux density (B_peak)
H_peak = N * Vpeak / (lc * Ac);  % Peak magnetic field (A/m)
B_peak = B_saturation;  % Use the saturation point for peak flux density (T)

% Calculate the power loss (P_loss)
P_loss = 0;
for i = 2:length(H)
    delta_H = H(i) - H(i-1);
    delta_B = B(i) - B(i-1);
    P_loss = P_loss + 0.5 * f * Ac * delta_H * (B(i-1) + B(i)) / 2;
end

% Plot the hysteresis loop
figure;
plot(H, B);
xlabel('Magnetic Field (A/m)');
ylabel('Flux Density (T)');
title('Hysteresis Loop');
grid on;

% Display the calculated power loss
fprintf('Power Loss at %d Hz: %f Watts\n', f, P_loss);
