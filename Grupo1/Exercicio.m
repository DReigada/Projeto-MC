% import the mathematical functions and methods used in this Script
Ex1Fun;
path(path, 'Methods');

fprintf('Método da Secante: %.8g\n', secant(h, 155, 160, 1e-10, 100));

fprintf('Método de Newton %.8g\n', newton(h, dh, 150, 1e-10, 100));

fprintf('Método do exercicio %.8g\n', ExMethod(h, dh, 150, 1e-10, 2));

fprintf('MATLAB %.8g\n', fzero(h, 150));
