% A 1000-VA 230/115-V transformer has been tested to determine its equivalent circuit. The results of the tests are shown below.

%Open-circuit test   | %Short-circuit test
%(on secondary side) | %(on primary side)
%VOC = 115 V         | VSC = 17.1 V
%IOC = 0.11 A        | ISC = 8.7 A
%POC = 3.9 W         | PSC = 38.1 W

%Solved according to the equations and examples in the 
% ELECTRIC MACHINERY FUNDAMENTALS, FIFTH EDITION textbook.

% Open-circuit test data
Voc = 115;  % Open-circuit voltage on the secondary side (in volts)
Ioc = 0.11; % Open-circuit current on the secondary side (in amperes)
Poc = 3.9;  % Open-circuit power on the secondary side (in watts)

% Short-circuit test data
Vsc = 17.1; % Short-circuit voltage on the primary side (in volts)
Isc = 8.7;  % Short-circuit current on the primary side (in amperes)
Psc = 38.1; % Short-circuit power on the primary side (in watts)

%OPEN CIRCUIT TEST (referred to the low-voltage or secondary side):
% |Yex|=|Gc-jBm|= Ioc/Voc 
Gcpolar = (Ioc / Voc); 

%Finding Theta (jBm)
polartheta = acos(Poc/(Voc*Ioc));

%Tranforming polar form to rectangular form 
Gcrect = Gcpolar*cos(polartheta);
recttheta = Gcpolar*sin(polartheta);

%Rc = 1/Gc
Rc = 1/Gcrect;
%Xm = 1/Bm
Xm= 1/recttheta;

%SHORT CIRCUIT TEST (referred to the high-voltage or primary side)
%|Zeq|=|Req+jXeq|= Vsc/Isc

%Polar Req
PReq = Vsc/Isc;

%Polar theta(jXeq)
poltheta = acos(Psc/(Vsc*Isc));

%Tranforming polar form to rectangular form 
PReqrect = PReq*cos(poltheta);
screctheta = PReq*sin(poltheta);

%Req = PReqrect
Req = PReqrect;
%Xeq = screctheta
Xeq = screctheta;

%To convert the equivalent circuit to the secondary side, 
%divide each series impedance by the square of the turns ratio (a = 230/115 = 2). 
a = 230/115;
Reqs = Req/(a*a);
Xeqs = Xeq/(a*a);

% Displaying the calculated parameters
fprintf('\nResistance and Reactance:\n\n');
fprintf('Reqs : %.4f ohms\n', Reqs);
fprintf('Xeqs : %.4f ohms\n\n', Xeqs);
fprintf('Excitation Branch Parameters:\n\n');
fprintf('Rc: %.4f ohms\n', Rc);
fprintf('Xm: %.4f ohms\n', Xm);
