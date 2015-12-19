% import the mathematical functions and methods used in this Script
Ex1Fun;
path(path, 'Methods');

disp('Primeiro zero [150, 160]:');

disp('Secante:');
secant(h, 150, 160, 1e-9, 5);
disp('Newton:');
newton(h, dh, 150, 1e-9, 5);

disp(' ');
disp('Segundo zero:');

disp('Secante: [2e4, 2.2e4]');
secant(h, 2e4, 2.2e4, 1e-9, 5);
disp('Newton:');
newton(h, dh, 2e4, 1e-9, 5);