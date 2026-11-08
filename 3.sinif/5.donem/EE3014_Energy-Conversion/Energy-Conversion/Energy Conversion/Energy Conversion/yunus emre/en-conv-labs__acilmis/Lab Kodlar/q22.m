% Given parameters
lc = 15.7 / 100;   % Length of the toroid core in meters
Ac = 7 / 10000;    % Cross-sectional area of the core in square meters
N = 100;            % Number of turns
f = 100;            % Frequency in Hz
I_max = 31.4;       % Maximum current in amperes

% B-H curve data
H = [0 100 200 300 400 500 600 700 800 900 1000 1100];
B = [0 0.65 1 1.1 1.2 1.25 1.27 1.3 1.32 1.34 1.35 1.35];

% Calculate the magnetic field strength (H) for the given current
H = H * (N / lc) * I_max;

% Initialize arrays to store the results
Flux = zeros(1, numel(H));
Losses = zeros(1, numel(H));

% Loop through the hysteresis curve
for i = 2:numel(H)
    % Calculate the change in magnetic flux
    delta_Flux = (B(i) - B(i-1)) * Ac;

    % Calculate the area under the hysteresis loop (energy loss)
    Losses(i) = delta_Flux * H(i) * f;

    % Calculate the total magnetic flux
    Flux(i) = Flux(i-1) + delta_Flux;
end

% Calculate the total power loss
PowerLoss = sum(Losses);

% Plot the hysteresis loop
figure;
plot(H, B);
xlabel('Magnetic Field Strength (H) [A/m]');
ylabel('Magnetic Flux Density (B) [T]');
title('Hysteresis Loop');
grid on;

% Display the total power loss
disp(['Total Power Loss: ' num2str(PowerLoss) ' Joules per cycle']);

% To convert to Watts (since 1 J/s = 1 Watt), you can divide by the period of the AC signal:
PowerLoss_Watts = PowerLoss / (1 / f);
disp(['Total Power Loss (Watts): ' num2str(PowerLoss_Watts)]);

% Optionally, you can also calculate the power loss per unit volume:
Volume = lc * Ac;
PowerLoss_Density = PowerLoss / Volume;
disp(['Power Loss Density (W/m^3): ' num2str(PowerLoss_Density)]);
