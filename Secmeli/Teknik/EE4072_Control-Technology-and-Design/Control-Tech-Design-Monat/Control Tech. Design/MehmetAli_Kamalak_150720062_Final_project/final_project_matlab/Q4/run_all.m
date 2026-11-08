base = fullfile(getenv('USERPROFILE'), 'Desktop', 'Control Tech. Design', ...
                'final_proje', 'final_project', 'Q4');
cd(base)
run('tank_design.m')
open_system('Q4_ObserverTank.slx')
