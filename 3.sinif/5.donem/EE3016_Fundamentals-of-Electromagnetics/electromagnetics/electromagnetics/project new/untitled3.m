% Potansiyel Dağılımını Görselleştirme (Sayısal Değerlerle)
figure;
imagesc(V'); % Potansiyel matrisini görselleştir (renk haritası)
colormap('jet'); % Renk haritası seçimi (mavi-kırmızı geçişi)
colorbar; % Renk skalası
title('Potansiyel Değerleri Tablosu');
xlabel('X ekseni'); ylabel('Y ekseni');

% Grid üzerindeki sayısal değerleri ekleyin
hold on; % Mevcut grafiği tut
[rows, cols] = size(V'); % Transpoz matrisin boyutları
for i = 1:cols
    for j = 1:rows
        if V(j, i) == -1 % İç sınır (-1 V) için mavi yazı
            text(i, j, sprintf('%.4f', V(j, i)), 'HorizontalAlignment', 'center', 'Color', 'blue', 'FontSize', 8);
        elseif V(j, i) == 5 % Dış sınır (+5 V) için kırmızı yazı
            text(i, j, sprintf('%.4f', V(j, i)), 'HorizontalAlignment', 'center', 'Color', 'red', 'FontSize', 8);
        else % Diğer değerler için siyah yazı
            text(i, j, sprintf('%.4f', V(j, i)), 'HorizontalAlignment', 'center', 'Color', 'k', 'FontSize', 8);
        end
    end
end
hold off;
