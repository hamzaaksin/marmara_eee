% simulation parameters
L = 500; 
dx = 5; 
dy = 5; 
dt = 0.5 * min(dx, dy) / (3e8 / sqrt(2.5)); % Time step (s), adjusted for εr=2.5
t0 = 0.05e-6; % time delay
delta = t0 / 3; 
T = 20 * t0; % total time
c = 3e8;
epsilon_r_free_space = 1; 
epsilon_r_circle = 2.5; 
mu_r = 1; 
mu = mu_r*4*pi*1e-7;
epsilon_free_space = epsilon_r_free_space * 8.854*1e-12; 
epsilon_circle = epsilon_r_circle * 8.854*1e-12; 

% generate grid
x = 0:dx:L;
y = 0:dy:L;
[X, Y] = meshgrid(x, y);

% circle parameters
circle_center = [L/2, L/2]; 
circle_radius = L/4; 

% check if point is inside the circle
inside_circle = @(i, j) (X(i, j) - circle_center(1))^2 + (Y(i, j) - circle_center(2))^2 <= circle_radius^2;

%initial conditions
E = zeros(size(X)); 

% boundary conditions 
E(:, 1) = 0; E(:, end) = 0; E(1, :) = 0; E(end, :) = 0;

% apply gaussian pulse
E_pulse = exp(-((0 - t0) / delta)^2); % at t=0
E(round(L/(2*dx)), round(L/(2*dy))) = E_pulse; %center


video = VideoWriter('soru9.mp4', 'MPEG-4');
open(video);

% figures for visualization
figure;
h = imagesc(x, y, E);
xlabel('x (cm)');
ylabel('y (cm)');
title('Wave Propagation with εr Circle');
colorbar;
axis equal;
axis([0 L 0 L]);

E_prev = E;
for t = 0:dt:T
    E_next = zeros(size(E));
    E_pulse = exp(-((t - t0) / delta)^2);% gaussian pulse at t=0
    E(round(L/(2*dx)), round(L/(2*dy))) = E_pulse; % at center point


    for i = 2:size(E, 1)-1
        for j = 2:size(E, 2)-1

            % determine if the point is inside the circle
            if inside_circle(i, j)
                epsilon = epsilon_circle;
            else
                epsilon = epsilon_free_space;
            end

            % calculate the update equation using the appropriate epsilon
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