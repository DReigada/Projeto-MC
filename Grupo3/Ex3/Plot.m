path(path, '..');

a = 100;
b = 200;

legaux = @(x) Legendre(2,x);   %the polynimial to plot
x = @(t) (t - (b + a)/2) / ((b - a)/2);
leg = @(t) legaux(x(t));
fzero(leg,150)
fplot(leg, [a, b]);    %plot the polynomial
