%defines the functions used in Exercicio script

f = @(R,C,L,Z,x)sqrt(1/R^2 + (x*C -1/(x*L))^2)-1/Z;
h = @(x)f(225,0.6e-6,0.5,75,x);

df = @(R,C,L,Z,x)((C+1/(L*x^2))*(-1/(L*x)+C*x))/sqrt(1/R^2+(-1/(L*x)+C*x)^2);
dh = @(x)df(225,0.6e-6,0.5,75,x);
