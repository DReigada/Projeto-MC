function y = newton(f,df,x0,tol,n)
% The Newton method for solving the nonlinear
% equation f(x)=0.
%       f - the function to find the zeros
%       df - the derivative of f
%       x - the first approximation
%       tol - the value to assume that it's zero
%       n - the maximum number of iterations

iter = 0;
u = f(x0);
v = df(x0);
err = abs(u/v);
while (err > tol) && (iter < n) && (v~=0)
      x1 = x0 - u/v;
      err = abs(x1-x0);
      x0 = x1;
      u = f(x0);
      v = df(x0);
      iter = iter+1;
end
y = x0;
end