%% Part 1: Solve Laplace's Equation for Given C-Shaped Structure
% Grid Parameters
Lx = 40; % Total length in x-direction (cm)
Ly = 30; % Total length in y-direction (cm)
dx = 2;  % Step size (cm)
dy = 2;
nx = Lx/dx + 1; % Number of grid points in x-direction
ny = Ly/dy + 1; % Number of grid points in y-direction

% Boundary Conditions
V_outer = 10; % Outer boundary potential
V_inner = -1; % Inner C-shaped boundary potential

% Initialize Grid
V = zeros(ny, nx); % Potential grid
V(:,1) = V_outer;   % Left boundary
V(:,end) = V_outer; % Right boundary
V(1,:) = V_outer;   % Top boundary
V(end,:) = V_outer; % Bottom boundary

% Define Fixed C-Shaped Inner Boundary Parameters
a = 30; % Total height of the structure
b = 10; % Thickness of the horizontal arms
c = 10; % Length of the vertical section of the arms
d = 20; % Horizontal extent of the arms
R = 10; % Radius of the semi-circular region

% Set the C-shaped boundary points in the grid
for i = 1:ny
    for j = 1:nx
        x = (j-1) * dx; % Physical x-coordinate
        y = (i-1) * dy; % Physical y-coordinate
        
        % Semi-circular region (left side)
        if (x - R)^2 + (y - Ly/2)^2 <= R^2 && y <= Ly/2 + R && y >= Ly/2 - R
            V(i,j) = V_inner;
        end
        
        % Top horizontal arm
        if (y >= Ly/2 + b/2 && y <= Ly/2 + b/2 && x >= R && x <= R + d)
            V(i,j) = V_inner;
        end
        % Bottom horizontal arm
        if (y >= Ly/2 - b/2 && y <= Ly/2 - b/2 && x >= R && x <= R + d)
            V(i,j) = V_inner;
        end
    end
end

% Iterative Solution using Gauss-Seidel Method
max_iter = 1000; % Maximum iterations
tol = 1e-5;     % Convergence tolerance

for iter = 1:max_iter
    V_old = V;
    for i = 2:ny-1
        for j = 2:nx-1
            if V(i, j) ~= V_inner && ~any(V(i, j) == [V_outer])
                V(i,j) = 0.25 * (V(i+1,j) + V(i-1,j) + V(i,j+1) + V(i,j-1));
            end
        end
    end
    % Convergence Check
    if max(max(abs(V - V_old))) < tol
        fprintf('Converged after %d iterations\n', iter);
        break;
    end
end

%% Part 2: Contour Plot for Equipotential Lines
figure;
contourf((0:dx:Lx), (0:dy:Ly), V, 20);
colorbar;
title('Equipotential Lines for Fixed C-Shaped Structure');
xlabel('x (cm)'); ylabel('y (cm)');

%% Part 3: Vector Plot of Electric Field
[Ex, Ey] = gradient(-V, dx, dy);
figure;
quiver((0:dx:Lx), (0:dy:Ly), Ex, Ey);
title('Electric Field Vector Plot for Fixed C-Shaped Structure');
xlabel('x (cm)'); ylabel('y (cm)');

%% Part 4: Decrease Step Sizes and Repeat
step_sizes = [1, 0.5, 0.25];
for k = 1:length(step_sizes)
    dx = step_sizes(k);
    dy = step_sizes(k);
    nx = Lx/dx + 1;
    ny = Ly/dy + 1;
    V = zeros(ny, nx);
    V(:,1) = V_outer;   % Left boundary
    V(:,end) = V_outer; % Right boundary
    V(1,:) = V_outer;   % Top boundary
    V(end,:) = V_outer; % Bottom boundary

    for i = 1:ny
        for j = 1:nx
            x = (j-1) * dx;
            y = (i-1) * dy;
            if (x - R)^2 + (y - Ly/2)^2 <= R^2 && y <= Ly/2 + R && y >= Ly/2 - R
                V(i,j) = V_inner;
            elseif (y >= Ly/2 + b/2 && y <= Ly/2 + b/2 && x >= R && x <= R + d)
                V(i,j) = V_inner;
            elseif (y >= Ly/2 - b/2 && y <= Ly/2 - b/2 && x >= R && x <= R + d)
                V(i,j) = V_inner;
            end
        end
    end

    % Solve for Finer Grid
    for iter = 1:max_iter
        V_old = V;
        for i = 2:ny-1
            for j = 2:nx-1
                if V(i, j) ~= V_inner && ~any(V(i, j) == [V_outer])
                    V(i,j) = 0.25 * (V(i+1,j) + V(i-1,j) + V(i,j+1) + V(i,j-1));
                end
            end
        end
        if max(max(abs(V - V_old))) < tol
            fprintf('Step size %.2f cm: Converged after %d iterations\n', dx, iter);
            break;
        end
    end

    % Plot for Current Step Size
    figure;
    contourf((0:dx:Lx), (0:dy:Ly), V, 20);
    colorbar;
    title(['Equipotential Lines for Step Size ', num2str(dx), ' cm']);
    xlabel('x (cm)'); ylabel('y (cm)');
end