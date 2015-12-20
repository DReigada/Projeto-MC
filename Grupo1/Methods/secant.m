function y = secant(f,x0,x1,tol,n)
% The secant method for solving the nonlinear
% equation f(x)=0.
%       f - the function to find the zeros
%       x0/x1 - the interval where the zero is
%       tol - the minimum value between iterations
%       n - the maximum number of iterations

%set the initial values
iter=0;
u=feval(f,x0);
v=feval(f,x1);
err=abs(x1-x0);
zero = fzero(f, x0);

%Print the head of the table
disp('__________________________________________________________')
disp('iter     xn             |z-xn|       |z-xn|/|z-xn-1|^1.6')
disp('__________________________________________________________')
while (err>tol) && (iter<n) && ((v-u)~=0)
      x=x1-v*(x1-x0)/(v-u);
      old = x0;
      x0=x1;
      u=v;
      x1=x;
      v=feval(f,x1);
      err=abs(x1-x0);
      iter=iter+1;
      
      %print the info of the current iterarion
      fprintf('%2.0f   %12.8g  %14.8g  %15.8g\n', iter, x1, abs(zero - x1), abs(zero - x1)/abs(zero - old)^2);
end
y = x1;
end
