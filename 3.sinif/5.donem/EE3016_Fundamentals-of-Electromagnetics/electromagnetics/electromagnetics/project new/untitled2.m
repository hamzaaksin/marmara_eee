% Parametreler
a = 30; b = 10; c = 10; d = 20; R = 10; % Boyutlar (cm)
delta = 2; % Adım boyutu (cm)
Nx = a / delta + 1; Ny = (c + d) / delta + 1; % Grid boyutları
V = 10 * ones(Nx, Ny); % Dış sınır +10 V

% İç bölgeyi tanımlama (Yarıçap R olan iç bölge -1 V)
x_center = (a / 2) / delta; y_center = (c / 2) / delta;
for i = 1:Nx
    for j = 1:Ny
        if sqrt((i - x_center)^2 + (j - y_center)^2) <= R / delta
            V(i, j) = -1; % İç sınır -1 V
        end
    end
end

% Laplace Denklemini Çözme (Iteratif Yöntem)
tolerance = 1e-4; % Hata toleransı
error = 1; iter = 0;
while error > tolerance
    V_old = V;
    for i = 2:Nx-1
        for j = 2:Ny-1
            % İç bölgeyi atla
            if sqrt((i - x_center)^2 + (j - y_center)^2) <= R / delta
                continue;
            end
            % Laplace denklemi
            V(i, j) = 0.25 * (V_old(i+1, j) + V_old(i-1, j) + V_old(i, j+1) + V_old(i, j-1));
        end
    end
    error = max(max(abs(V - V_old)));
    iter = iter + 1;
end
fprintf('Iterasyon tamamlandı: %d\n', iter);

% Kontur Grafiği (Ekipotansiyel Çizgiler)
figure;
contourf(V', 20); % Kontur grafiği
colorbar;
title('Ekipotansiyel Çizgiler');
xlabel('X ekseni'); ylabel('Y ekseni');

% Elektrik Alan Vektör Grafiği
[Ex, Ey] = gradient(-V'); % Elektrik alan (potansiyelin gradyanı)
figure;
quiver(Ex, Ey); % Vektör grafiği
title('Elektrik Alan Vektör Grafiği');
xlabel('X ekseni'); ylabel('Y ekseni');
