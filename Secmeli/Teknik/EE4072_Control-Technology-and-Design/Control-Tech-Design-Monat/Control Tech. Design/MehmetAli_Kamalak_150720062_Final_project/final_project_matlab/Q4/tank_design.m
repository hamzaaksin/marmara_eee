%% tank_design.m  (DISCRETE VERSION)

clear; clc;

%% Sample time
Ts = 1;   % seconds

%% Parameters
m    = 100;        % kg
cp   = 4180;       % J/(kg*C)
C    = m*cp;       % J/C

mdot = 0.10;       % kg/s
Gf   = mdot*cp;    % W/C

Gh   = 200;        % W/C
Ch   = 5e4;        % J/C
eta  = 0.90;

%% Continuous model
A_c = [-(Gf+Gh)/C,   Gh/C;
        Gh/Ch,      -Gh/Ch];

B_c = [0; eta/Ch];
E_c = [1/C; 0];

Cmat = [1 0];
Dp   = [0 0];

%% Discretize plant with inputs [u; d]
sys_c  = ss(A_c, [B_c E_c], Cmat, [0 0]);
sys_d  = c2d(sys_c, Ts, 'zoh');

A  = sys_d.A;        % 2x2
Bp = sys_d.B;        % 2x2  (col1=u, col2=d)

B_u = Bp(:,1);

%% Discrete integral state feedback
Aci = [A            zeros(2,1);
      -Ts*Cmat      1];

Bci = [B_u;
       0];

pc  = [-0.010 -0.012 -0.016];   % desired continuous poles
pd  = exp(pc*Ts);               % mapped discrete poles

Kci = place(Aci, Bci, pd);
K   = Kci(1:2);
Ki  = Kci(3);

%% Augmented observer for [x; d]
Ab_c = [A_c E_c;
        0 0 0];

Bb_c = [B_c;
        0];

Cb = [Cmat 0];

sysb_c = ss(Ab_c, Bb_c, Cb, 0);
sysb_d = c2d(sysb_c, Ts, 'zoh');

Ab = sysb_d.A;   % 3x3
Bb = sysb_d.B;   % 3x1

po_c = 5*pc;
po_d = exp(po_c*Ts);

L = place(Ab', Cb', po_d)';   % 3x1

%% Export to base workspace
assignin('base','Ts',Ts);

assignin('base','A',A);
assignin('base','Bp',Bp);
assignin('base','Cmat',Cmat);
assignin('base','Dp',Dp);

assignin('base','Ab',Ab);
assignin('base','Bb',Bb);
assignin('base','Cb',Cb);
assignin('base','L',L);

assignin('base','K',K);
assignin('base','Ki',Ki);

disp('Loaded discrete design variables: Ts, A, Bp, Cmat, Dp, Ab, Bb, Cb, L, K, Ki');
