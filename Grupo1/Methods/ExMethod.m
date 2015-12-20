function z = ExMethod(f,df,x,tol,n)
% The method given in exercise 2 for solving the nonlinear
% equation f(x)=0.
%       f - the function to find the zeros
%       df - the derivative of f
%       x - the first approximation
%       tol - the value to assume that it's zero
%       n - the maximum number of iterations

%set the initial values
iter = 0;
u = f(x);
v = df(x);
err = tol +1;
zero = fzero(f, x);

%Print the head of the table
disp('__________________________________________________________')
disp('iter     xn             |z-xn|       |z-xn|/|z-xn-1|^3')
disp('__________________________________________________________')
while (err > tol) && (iter < n) && (v~=0)
    y = x - u/v;
    old = x;
    x = y - f(y)/v;
    u = f(x);
    v = df(x);
    iter = iter + 1;
    %print the info of the current iterarion
    fprintf('%2.0f   %12.8g  %14.8g %14.8g\n', iter, x, abs(zero - x), abs(zero - x)/abs(zero - old)^3);
end

z = x;
end