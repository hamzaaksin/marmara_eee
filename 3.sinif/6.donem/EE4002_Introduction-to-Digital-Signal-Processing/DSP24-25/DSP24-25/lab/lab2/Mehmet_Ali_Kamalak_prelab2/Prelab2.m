clc; clear; close all;

%% **1.
b1 = [1, -0.4944, 0.64];
a1 = [1, -1.3315, 0.49];

b2 = [1, 0.4944, 0.64];
a2 = [1, 1.3315, 0.49];

disp('Difference Equation for System 1:');
fprintf('y[n] = %.4f*x[n] + %.4f*x[n-1] + %.4f*x[n-2] - %.4f*y[n-1] - %.4f*y[n-2]\n', ...
    b1(1), b1(2), b1(3), a1(2), a1(3));

disp('Difference Equation for System 2:');
fprintf('y[n] = %.4f*x[n] + %.4f*x[n-1] + %.4f*x[n-2] - %.4f*y[n-1] - %.4f*y[n-2]\n', ...
    b2(1), b2(2), b2(3), a2(2), a2(3));

%% **2. 
figure;
subplot(1,2,1);
zplane(roots(b1), roots(a1));
title('System 1 Pole-Zero Plot');
grid on;

subplot(1,2,2);
zplane(roots(b2), roots(a2));
title('System 2 Pole-Zero Plot');
grid on;

%% **3. 
N = 256;
x = randn(1, N);

%% **4. 
y1 = filter(b1, a1, x);
y2 = filter(b2, a2, x);

figure;
subplot(2,1,1);
plot(abs(fft(x)));
title('Input Signal Spectrum');
grid on;

subplot(2,1,2);
plot(abs(fft(y1)));
title('Output Signal Spectrum - System 1');
grid on;

%% **5.
y_parallel = (y1 + y2) / 2;
y_cascade = filter(b2, a2, y1);

figure;
plot(abs(fft(y_parallel)));
title('Output Spectrum - Parallel Systems');
grid on;

figure;
plot(abs(fft(y_cascade)));
title('Output Spectrum - Cascade Systems');
grid on;

%% **6.
poles_cases = [
    0.8 * exp(1j*pi*[0.3, -0.3]);
    0.8 * exp(1j*pi*[0.4, -0.4]);
    0.8 * exp(1j*pi*[0.5, -0.5]);
    0.1 * exp(1j*pi*[0.4, -0.4]);
    0.95 * exp(1j*pi*[0.4, -0.4])
];

figure;
for i = 1:size(poles_cases, 1)
    a_new = poly(poles_cases(i, :));
    b_new = [1]; % Numerator = 1
    subplot(3,2,i);
    freqz(b_new, a_new, 100);
    title(sprintf('Magnitude Response Case %d', i));
end

%% **7. 
H1 = tf([1], [1 -2*0.8*cos(pi*0.3) 0.8^2], -1);
H2 = tf([1], [1 -2*0.8*cos(pi*0.4) 0.8^2], -1);

figure;
subplot(2,1,1);
impulse(H1, 30);
title('Impulse Response - System 1');
grid on;

subplot(2,1,2);
impulse(H2, 30);
title('Impulse Response - System 2');
grid on;

figure;
subplot(2,1,1);
step(H1, 30);
title('Step Response - System 1');
grid on;

subplot(2,1,2);
step(H2, 30);
title('Step Response - System 2');
grid on;

%% **8.
figure;
freqz([1], [1 -2*0.8*cos(pi*0.3) 0.8^2], 100);
hold on;
freqz([1], [1 -2*0.8*cos(pi*0.4) 0.8^2], 100);
legend('System 1', 'System 2');
title('Frequency Response Comparison');
grid on;
