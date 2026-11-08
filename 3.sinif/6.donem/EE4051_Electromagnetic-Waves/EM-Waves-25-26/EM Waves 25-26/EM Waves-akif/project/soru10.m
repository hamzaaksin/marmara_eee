% simulation parameters
L = 500; 
dx = 5; 
dy = 5; 
dt = 0.5 * min(dx, dy) / 3e8; % Time step (s), using ∆t ≤ 0.5∆/c
t0 = 0.05e-6; 
delta = t0 / 3; 
T = 17 * t0; % total time
c = 3e8; 
f_c = 2.5e9; % center frequency of the cosine-Gaussian pulse
epsilon_r = 1;
mu_r = 1; 
epsilon = epsilon_r * 8.854e-12; 
mu = mu_r * 4 * pi * 1e-7; 

% generate grid
x = 0:dx:L;
y = 0:dy:L;
[X, Y] = meshgrid(x, y);

% initial conditions
E = zeros(size(X)); 

% boundary conditions 
E(:, 1) = 0; E(:, end) = 0; E(1, :) = 0; E(end, :) = 0;

video = VideoWriter('soru10.mp4', 'MPEG-4');
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

for t = 0:dt:T
    E_next = zeros(size(E));
    % cosine-Gaussian Pulse 
    E_pulse = exp(-((t - t0) / delta)^2) * cos(2 * pi * f_c * (t - t0));
    E(50,50) = E_pulse; %at center point
    
    for i = 2:size(E, 1)-1
        for j = 2:size(E, 2)-1
            E_next(i,j) = 2 * E(i,j) - E_prev(i,j) + ...
                (dt^2) / (mu * epsilon * dx^2) * ...
                (E(i+1,j) + E(i-1,j) + E(i,j+1) + E(i,j-1) - 4 * E(i,j));
        end
    end
    
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