clear
%define parameters
L = 500;
dx = 1;
dy = 1;
c = 3e8;
dt = (0.5 * dx) / c; % ∆t ≤ 0.5∆/c
t0 = 0.05e-6; % time delay
delta = t0 / 3;
T = 15 * t0; % total time
mu_r = 1;
mu = mu_r * 4 * pi * 1e-7;

epsilon_r = 1;
epsilon = epsilon_r * 8.854*1e-12;

% generate grid
x = 0:dx:L;
y = 0:dy:L;
[X, Y] = meshgrid(x, y);
E = zeros(size(X));

% boundary conditions
E(:, 1) = 0; E(:, end) = 0; E(1, :) = 0; E(end, :) = 0;

%create and save video
video = VideoWriter('stepsize1.mp4', 'MPEG-4');
open(video);

% figures for visualization
figure;
h = imagesc(x, y, E);
xlabel('x (cm)');
ylabel('y (cm)');
title('Wave Propagation');
colorbar;
axis equal;
axis([0 L 0 L]);

E_prev = E;
E_observationpoint = zeros(1, ceil(T/dt)+1);
E_observationpoint1 = zeros(1, ceil(T/dt)+1);
E_source = zeros(1, ceil(T/dt)+1);

% pulse equations
for t = 0:dt:T
    E_next = zeros(size(E));

    E_pulse = exp(-((t - t0) / delta)^2); % at t=0
    E(250,250) = E_pulse;
    for i = 2:size(E, 1)-1
        for j = 2:size(E, 2)-1
            E_next(i,j) = 2 * E(i,j) - E_prev(i,j) + (dt^2) / (mu * epsilon * dx^2) * (E(i+1,j) ...
                + E(i-1,j) + E(i,j+1) + E(i,j-1) - 4 * E(i,j));
        end
    end

    % observation points
    E_observationpoint(ceil(t/dt)+1) = E(250,300);
    E_observationpoint1(ceil(t/dt)+1) = E(250,350);
    E_source(ceil(t/dt)+1) = E(250,250);
    E_prev = E;
    E = E_next;

    % update boundary conditions
    E(:, 1) = 0; E(:, end) = 0; E(1, :) = 0; E(end, :) = 0;

    % update visualization
    set(h, 'CData', E);
    drawnow;

    writeVideo(video, getframe(gcf));
end

close(video);

subplot(2,1,1)
plot(0:dt:T, E_observationpoint);
xlabel('Time (s)');
ylabel('Electric Field');
title('Electric Field-Time at (250,300)');


subplot(2,1,2)
plot(0:dt:T, E_source);
xlabel('Time (s)');
ylabel('Gaussian Pulse Signal');
title('Gaussian Pulse Signal-Time at (250,250)');


figure()
subplot()
plot(0:dt:T, E_observationpoint,'b',0:dt:T,E_observationpoint1,'r');
xlabel('Time (s)');
ylabel('Electric Field');
title('Electric Field-Time at (250,350) and (250,300)');
legend('Electric Field at (250,350)','Electric Field at (250,300)')
