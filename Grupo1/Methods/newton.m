function y = newton(f,df,x0,tol,n)
% The Newton method for solving the nonlinear
% equation f(x)=0.
%       f - the function to find the zeros
%       df - the derivative of f
%       x - the first approximation
%       tol - the minimum value between iterations
%       n - the maximum number of iterations

%set the initial values
iter = 0;
u = f(x0);
v = df(x0);
err = tol +1;
zero = fzero(f, x0);

%Print the head of the table
disp('__________________________________________________________')
disp('iter     xn             |z-xn|       |z-xn|/|z-xn-1|^2')
disp('__________________________________________________________')
while (err > tol) && (iter < n) && (v~=0)
      x1 = x0 - u/v;
      err = abs(x1-x0);
      old = x0;
      x0 = x1;
      u = f(x0);
      v = df(x0);
      iter = iter+1;
      
      %print the info of the current iterarion
      fprintf('%2.0f   %12.8g  %14.8g  %15.8g\n', iter, x1, abs(zero - x1), abs(zero - x1)/abs(zero - old)^1.6);

end
y = x0;
end