% Given datas
H = [0 100 200 300 400 500 600 700 800 900 1000];
B = [0 0.65 1 1.1 1.2 1.25 1.27 1.3 1.32 1.34 1.35];

% Given parameters
lc_cm = 15.7; % cm
Ac_cm2 = 7; % cm^2
N = 100; % Turns
f = 100; % Hz

% lc and Ac cm to meters
lc_m = lc_cm / 100;
Ac_m2 = Ac_cm2 / (100^2);

% Hysteresis loop plot
figure;
plot(H, B);
xlabel('Magnetic Field (H) [A/m]');
ylabel('Magnetic Flux Density (B) [T]');
title('Hysteresis Loop for Silicon Steel Core');
grid on;

% Calculate B at H = 1000 (assuming it's near saturation)
B_saturation = interp1(H, B, 1000);

% Calculate power loss
P_loss = (B_saturation^2 * Ac_m2 * f * N) / lc_m;

disp(['Power Loss at 100 Hz: ', num2str(P_loss), ' watts']);
