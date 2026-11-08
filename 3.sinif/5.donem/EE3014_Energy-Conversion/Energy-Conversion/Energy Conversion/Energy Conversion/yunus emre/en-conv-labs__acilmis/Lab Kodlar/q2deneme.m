% Define the given parameters
lc = 0.157;  % Length of the toroid in meters (15.7 cm)
Ac = 0.0007; % Cross-sectional area of the toroid in square meters (7 cm^2)
N = 100;    % Number of turns
f = 100;    % Frequency in Hz

% Create a time vector for one complete cycle at the given frequency (100 Hz)
t = 0:1/(2*f):1/f;

% Calculate the magnetic field strength (H) for one cycle based on the given data points
H_data = [0 100 200 300 400 500 600 700 800 900 1000];
B_data = [0 0.65 1 1.1 1.2 1.25 1.27 1.3 1.32 1.34 1.35];

% Interpolate H values for the entire cycle
H_cycle = interp1(H_data, B_data, mod(t, 1/f));

% Calculate the magnetic flux density (B) and magnetic flux (Φ) based on the interpolated H values
mu0 = 4 * pi * 1e-7; % Permeability of free space in H/m
B_cycle = H_cycle / mu0;
phi = B_cycle * Ac;

% Calculate the voltage induced in the toroid coil using Faraday's law
V_induced = N * Ac * diff(phi) / diff(t);

% Calculate the power loss (P_loss) in the core due to hysteresis by integrating the product of V_induced and current (I) over time
I = V_induced / (N * Ac);
% Calculate the power loss (P_loss) in the core due to hysteresis
% Calculate the power loss (P_loss) in the core due to hysteresis
dt = t(2) - t(1);
P_loss = sum((I.^2) * lc * dt) * 2 * pi * f;



% Plot the hysteresis loop
figure;
plot(H_cycle, B_cycle, 'b');
xlabel('H (A/m)');
ylabel('B (T)');
title('Hysteresis Loop');
grid on;

% Display the calculated power loss
fprintf('Power Loss at %d Hz: %.6f Watts\n', f, P_loss);
