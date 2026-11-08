function [Vin, Vout_ref, Iout_nom, Rload_nom, L, C, Resr] = get_buck_params()
% Buck converter temel parametrelerini döndürür.

Vin      = 48;        % Giriş gerilimi (V)
Vout_ref = 24;        % Hedef çıkış gerilimi (V)
Iout_nom = 2;         % Nominal yük akımı (A)

Rload_nom = Vout_ref / Iout_nom;

L    = 1e-3;          % Endüktans (H)
C    = 470e-6;        % Kapasitans (F)
Resr = 0.1;           % Kondansatör ESR (Ohm)
end
