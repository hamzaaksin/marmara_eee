function [Gc_pi, Kp, Ki] = design_pi_controller(Gvd)
% Verilen Gvd(s) için pidtune kullanarak PI kontrolör tasarlar.

Gc_pi = pidtune(Gvd,'PI');   % Control System Toolbox gerekir
Kp    = Gc_pi.Kp;
Ki    = Gc_pi.Ki;
end
