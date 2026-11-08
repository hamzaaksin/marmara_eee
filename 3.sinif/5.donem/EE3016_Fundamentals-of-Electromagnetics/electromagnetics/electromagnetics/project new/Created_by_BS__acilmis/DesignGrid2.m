clc; clear; close all;

% Grid setup
dx = 2; % Grid step in cm
dy = 2;
x = 0:dx:80; % x-coordinates
y = 0:dy:60; % y-coordinates
[X, Y] = meshgrid(x, y);

% Initialize potential matrix
V = 10 * ones(length(y), length(x)); % Entire area with 10V initially

% Define boundary conditions for the closed region (-1V)
theta = linspace(pi/2, 3*pi/2, 100); % Semi-circle (counter-clockwise direction)
r = 10; % Radius of semi-circle
x_circle = 20 + r * cos(theta); % Semi-circle x-coordinates
y_circle = 20 + r * sin(theta); % Semi-circle y-coordinates

r2 = 5.5;
x_circle2 = 30 + r2 * cos(theta); 
y_circle2 = 18.5 + r2 * sin(theta);

r3 = 2;
x_circle_UP = 60 + r3 * cos(theta); 
y_circle_UP = 26 + r3 * sin(theta);

r4 = 1;
x_circle_DOWN = 60 + r4 * cos(theta); 
y_circle_DOWN = 12 + r4 * sin(theta);

% Update the closed region with new coordinates
x_closed = [x_circle, 20, 30, 30, 60, fliplr(x_circle_DOWN), 60, 30, fliplr(x_circle2), 30, 60, fliplr(x_circle_UP), 60, 30 ,30, 20];
y_closed = [y_circle, 10, 10, 11, 11, fliplr(y_circle_DOWN), 13, 13, fliplr(y_circle2), 24, 24, fliplr(y_circle_UP), 28, 28 ,30, 30];

% Identify the points inside the closed region
mask = inpolygon(X, Y, x_closed, y_closed);

% Apply boundary conditions
V(mask) = -1; % Inside the closed region, potential is -1V
V(~mask & (X == 0 | X == 80 | Y == 0 | Y == 60)) = 10; % Boundary conditions on outer edges

% Solve Laplace's equation using iterative FD method
tolerance = 1e-4;
max_iter = 5000;
error = Inf;
iter = 0;

while error > tolerance && iter < max_iter
    V_old = V;
    
    % Update potential using finite difference (excluding boundary conditions)
    for i = 2:length(y)-1
        for j = 2:length(x)-1
            if ~mask(i, j) % Update only for points outside the fixed potential regions
                V(i, j) = 0.25 * (V_old(i+1, j) + V_old(i-1, j) + V_old(i, j+1) + V_old(i, j-1));
            end
        end
    end
    
    % Compute error
    error = max(max(abs(V - V_old)));
    iter = iter + 1;
end

% Compute electric field (E = -grad(V))
[Ex, Ey] = gradient(-V, dx, dy);

% Plot the potential distribution with contour lines
figure;
contourf(X, Y, V, 20, 'LineColor', 'none');
colorbar;
title('Equi-potential Lines');
xlabel('x (cm)');
ylabel('y (cm)');
axis equal;
hold on;

% Overlay the main closed region boundary
plot(x_closed, y_closed, 'k-', 'LineWidth', 1.5);

% Plot the electric field as a vector plot
figure;
quiver(X, Y, Ex, Ey, 'b');
title('Electric Field');
xlabel('x (cm)');
ylabel('y (cm)');
axis equal;
hold on;

% Overlay the main closed region boundary
plot(x_closed, y_closed, 'k-', 'LineWidth', 1.5);
