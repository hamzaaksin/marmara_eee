f = @(z) z.^2 + 1i*z - real(z);

theta = linspace(0, 2*pi, 100);
z_circle = 2 * exp(1i*theta);

w_circle = f(z_circle);

figure;
plot(real(w_circle), imag(w_circle), 'b');
axis equal;
title('Image of |z| = 2 under w = z^2 + iz - Re(z)');
xlabel('Re(w)');
ylabel('Im(w)');
grid on;
