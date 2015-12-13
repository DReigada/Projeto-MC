function y = newton(f,df,x,tol,n)
% The Newton method for solving the nonlinear
% equation f(x)=0.
%       f - the function to find the zeros
%       df - the derivative of f
%       x - the first approximation
%       tol - the value to assume that it's zero
%       n - the maximum number of iterations

iter = 0;
u = f(x);
v = df(x);
while (abs(u) > tol) && (iter <= n) && (v~=0)
      x = x - u/v;
      u = f(x);
      v = df(x);
      iter = iter+1;
end
y = x;
end