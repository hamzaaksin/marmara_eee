%% Buck Converter for LED Driver - Main Script (FINAL)
clear; clc; close all;

% functions klasorunu MATLAB yoluna ekle
addpath('functions');

%% 1. Buck parametrelerini fonksiyondan al
[Vin, Vout_ref, Iout_nom, Rload_nom, L, C, Resr] = get_buck_params();

%% 2. Switching ve simülasyon bilgileri
fsw      = 50000;        % Switching frekansi (Hz)
Ts       = 1/fsw;        % Örnekleme periyodu
sim_time = 0.05;         % Simülasyon süresi (s)

%% 3. Yük adımı bilgileri (1A -> 5A)
I_load_light = 1;
I_load_heavy = 5;
R_load_light = Vout_ref / I_load_light;
R_load_heavy = Vout_ref / I_load_heavy;
t_step_load  = 0.01;    

%% 4. Küçük sinyal buck modeli (ESR dahil)
s = tf('s');
num = Vin * (1 + Resr*C*s);
den = L*C*s^2 + (L/Rload_nom + Resr*C)*s + 1;
Gvd = num / den;

%% 5. PI kontrolör tasarımı (yardımci fonksiyon ile)
[Gc_pi, Kp, Ki] = design_pi_controller(Gvd);
fprintf('Tuned PI gains: Kp = %.4f, Ki = %.4f\n', Kp, Ki);

%% 6. PI transfer fonksiyonu ve açık çevrim
Gc = Kp + Ki/s;
T_open = Gc * Gvd;

figure;
margin(T_open);
grid on;
title('Open-loop Bode Plot with Tuned PI Controller (ESR Included)');

%% 7. Kapali cevrim step cevabi ve performans metrikleri
G_closed = feedback(Gc*Gvd,1);

figure;
step(G_closed);
grid on;
title('Closed-loop Step Response (Average Model)');

info = stepinfo(G_closed);
disp('--- Step Response Info ---');
disp(info);
