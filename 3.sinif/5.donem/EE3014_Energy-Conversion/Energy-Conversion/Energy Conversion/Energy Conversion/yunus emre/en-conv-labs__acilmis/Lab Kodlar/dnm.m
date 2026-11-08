% Define given parameters
lc = 15.7 / 100; % Convert to meters
Ac = 7 / 10000; % Convert to square meters
N = 100; % Number of turns
f = 100; % Frequency in Hz
B = [0 0.65 1 1.1 1.2 1.25 1.27 1.3 1.32 1.34 1.35]; % Flux density (T)
H = [0 100 200 300 400 500 600 700 800 900 1000]; % Magnetizing force (A/m)

% Interpolate H from B
H_interpolated = interp1(B, H, B);

% Calculate H_core (Magnetic field intensity in the core)
H_core = H_interpolated * N;

% Calculate the magnetic flux (Φ) in the core
Phi = H_core * Ac;

% Plot the hysteresis loop
figure;
plot(H_core, B);
title('Hysteresis Loop');
xlabel('Magnetic Field Strength (A/m)');
ylabel('Flux Density (T)');

% Calculate the area enclosed by the hysteresis loop
loop_area = trapz(H_core, B);

% Calculate the core loss (hysteresis loss) at 100 Hz
core_loss = loop_area * f;

fprintf('Core Loss at %d Hz: %.4f Watts\n', f, core_loss);
