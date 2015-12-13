function y = secant(f,x0,x1,tol,n)
% The secant method for solving the nonlinear
% equation f(x)=0.
%       f - the function to find the zeros
%       x0/x1 - the first approximations
%       tol - the value to assume that it's zero
%       n - the maximum number of iterations

%set the initial values
iter = 0;
u = f(x0); 
v = f(x1);
while (abs(v) > tol) && (iter <= n) && ((v-u) ~= 0)
      x = x1-v*(x1-x0)/(v-u);
      x0 = x1;
      u = v;
      x1 = x;
      v = f(x1);
      iter = iter + 1;
end
y = x1;
end   