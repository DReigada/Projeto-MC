% import the mathematical functions and methods used in this Script
Functions;
path(path, 'Methods');

disp('Primeiro zero [150, 160]:');
fprintf('\nSecante:\n');
secant(h, 150, 160, 1e-9, 5);
fprintf('\nNewton:\n');
newton(h, dh, 150, 1e-9, 5);
fprintf('\nMétodo dado:\n');
ExMethod(h, dh, 150, 1e-9, 2);

disp(' ');
fprintf('\n\nSegundo zero [2e4, 2.2e4]:\n');
fprintf('\nSecante:\n');
secant(h, 2e4, 2.2e4, 1e-9, 5);
fprintf('\nNewton:\n');
newton(h, dh, 2e4, 1e-9, 5);
fprintf('\nMétodo dado:\n');
ExMethod(h, dh, 2e4, 1e-9, 2);