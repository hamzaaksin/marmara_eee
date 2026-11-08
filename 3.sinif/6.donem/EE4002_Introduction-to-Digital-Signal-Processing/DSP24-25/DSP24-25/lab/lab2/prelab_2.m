%%A

%for system 1
b1 = [1, -0.4944, 0.64]; 
a1 = [1, -1.3315, 0.49];  

%for system 2
b2 = [1, 0.4944, 0.64];  
a2 = [1, 1.3315, 0.49];  

%Equations
disp('Difference Equation for System 1:');
fprintf('y[n] = %.4f*x[n] + %.4f*x[n-1] + %.4f*x[n-2] - %.4f*y[n-1] - %.4f*y[n-2]\n', ...
    b1(1), b1(2), b1(3), a1(2), a1(3));

disp('Difference Equation for System 2:');
fprintf('y[n] = %.4f*x[n] + %.4f*x[n-1] + %.4f*x[n-2] - %.4f*y[n-1] - %.4f*y[n-2]\n', ...
    b2(1), b2(2), b2(3), a2(2), a2(3));

%%B
clc; clear; close all;

% System 1
b1 = [1, -0.4944, 0.64];  
a1 = [1, -1.3315, 0.49];

% System 2
b2 = [1, 0.4944, 0.64];  
a2 = [1, 1.3315, 0.49];


z1 = roots(b1);  
p1 = roots(a1);  

z2 = roots(b2);  
p2 = roots(a2);  


figure;
subplot(1,2,1);
zplane(z1, p1);
title('System 1 Pole-Zero Plot');
grid on;

subplot(1,2,2);
zplane(z2, p2);
title('System 2 Pole-Zero Plot');
grid on;

%%C
clc; clear; close all;

% Sistem 1 için katsayılar
b1 = [1, -0.4944, 0.64];  
a1 = [1, -1.3315, 0.49];

% Rastgele bir giriş sinyali oluşturalım
x = randn(1, 100); % 100 örnek uzunluğunda Gaussian dağılımlı rastgele sinyal

% Fonksiyonu çağırarak çıkış sinyalini hesapla
y1 = input_filter(b1, a1, x);

% Sonuçları çizdirme
figure;
subplot(2,1,1);
plot(x);
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(y1);
title('Output Signal y[n]');
xlabel('n');
ylabel('Amplitude');
grid on;
