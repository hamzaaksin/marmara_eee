% Define the points
z1 = 1;
z2 = 1 + 1i;

% Apply the complex mapping
w1 = f(z1);
w2 = f(z2);

% Plot the image
figure;
plot([real(w1), real(w2)], [imag(w1), imag(w2)], 'r', 'LineWidth', 2);
hold on;
scatter(real(w1), imag(w1), 'ro', 'MarkerSize', 10);
scatter(real(w2), imag(w2), 'ro', 'MarkerSize', 10);
axis equal;
title('Image of the line segment from 1 to 1+i under w = iz^3 + z - i');
xlabel('Re(w)');
ylabel('Im(w)');
grid on;
