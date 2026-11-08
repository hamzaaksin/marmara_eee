% simulation parameters
L = 500;
dx = 5;
dy = 5;
dt = 0.5 * min(dx, dy) / (3e8); % Time step (s), using ∆t ≤ 0.5∆/c
t0 = 0.05e-6;
delta = t0 / 3;
T = 50 * t0; % total time
c = 3e8;
epsilon_r = 1;
mu_r = 1;
sigma = 0.01;
epsilon = epsilon_r * 8.854e-12;
mu = mu_r * 4 * pi * 1e-7;

% generate grid
x = 0:dx:L;
y = 0:dy:L;
[X, Y] = meshgrid(x, y);

%initial conditions
E = zeros(size(X)); % Initialize electric field
E_prev = E; % Initialize previous electric field
E_next = zeros(size(E)); % Placeholder for the next electric field values

video = VideoWriter('soru12.mp4', 'MPEG-4');
open(video);

% figures for visualization
figure;
h = imagesc(x, y, E);
colorbar;
axis equal;
axis([0 L 0 L]);
xlabel('x (cm)');
ylabel('y (cm)');
title('Wave Propagation with Medium Loss');


for t = dt:dt:T

    E_pulse = exp(-((t - t0) / delta)^2);
    E(round(size(X,1)/2),round(size(Y,2)/2)) = E_pulse;

    % electric field with consideration for medium loss
    for i = 2:(size(X,1)-1)
        for j = 2:(size(Y,2)-1)
            E_next(i,j) = 2 * E(i,j) - E_prev(i,j) + ...
                (dt^2) / (mu * epsilon * dx^2) * ...
                (E(i+1,j) + E(i-1,j) + E(i,j+1) + E(i,j-1) - 4 * E(i,j)) - ...
                dt * (sigma / epsilon) * E(i,j); %medium loss
        end
    end

    % update boundary conditions
    E_next(:,1) = 0; E_next(:,end) = 0; E_next(1,:) = 0; E_next(end,:) = 0;

    E_prev = E;
    E = E_next;

    % visualization
    set(h, 'CData', E);
    drawnow;
    writeVideo(video, getframe(gcf));
end
close(video);