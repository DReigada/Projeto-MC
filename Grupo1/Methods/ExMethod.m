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

while (abs(v) > tol) && (iter <= n) && (v~=0)
    y = x - u/v;
    x = y - f(y)/v;
    u = f(x);
    v = df(x);   
    iter = iter + 1;
end

z = x;
end