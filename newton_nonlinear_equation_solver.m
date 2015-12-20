%{

Script for solving the non-linear system of equations F(X) = 0,
where F is a concrete R3 -> R3 function.

For this we are using the Newton's method:
    
    J(x(i)) * delta(x(i)) = -F(x(i));
    
    x(i+1) = x(i) + delta(x(i)).

For this method we need to calculate the Jacobian matrix of F. 
Thus, all F's partial derivatives must exist and be continuous in [R, R, R].
Furthermore, this Jacobian matrix of F must be invertible in this domain.

%}

clear; clc;

syms a b c

% The function that we want to solve for 0 (using Newton's method)
F =[ 7 * a ...
   + b * (1 + exp(0.5 * c) ...
          + exp(      c) ...
          + exp(1.5 * c) ...
          + exp(2   * c) ...
          + exp(2.5 * c) ...
          + exp(3   * c)) ...
   + 4.67; ...

     a * (1 + exp(0.5 * c) ...
			+ exp(      c) ...
			+ exp(1.5 * c) ...
			+ exp(2   * c) ...
			+ exp(2.5 * c) ...
			+ exp(3   * c)) ... 
   + b * (1 + exp(c) ...
			+ exp(2 * c) ...
			+ exp(3 * c) ...
			+ exp(4 * c) ...
			+ exp(5 * c) ...
			+ exp(6 * c)) ...
   + (3 + 1.89 * exp(0.5 * c) ...
		+ 1.03 * exp(      c) ...
		+ 0.36 * exp(1.5 * c) ...
		- 0.16 * exp(2   * c) ...
		- 0.57 * exp(2.5 * c) ...
		- 0.88 * exp(3   * c)); ...

     a * b * (0.5 * exp(0.5 * c) ...
     		+       exp(      c) ...
			+ 1.5 * exp(1.5 * c) ...
			- 2   * exp(2   * c) ...
			- 2.5 * exp(2.5 * c) ...
			- 3   * exp(3   * c))...
   + b^2 * (0.5 * exp(    c) ...
		  + 	  exp(2 * c) ...
		  + 1.5 * exp(3 * c) ...
		  + 2   * exp(4 * c) ...
		  + 2.5 * exp(5 * c) ...
		  + 3   * exp(6 * c)) ...
   + b * (0.945 * exp(0.5 * c) ...
		+ 1.030 * exp(      c) ...
		+ 0.540 * exp(1.5 * c) ...
		- 0.320 * exp(2   * c) ...
		- 1.425 * exp(2.5 * c) ...
		- 2.640 * exp(3   * c))];

% The Jacobian of F
JF = jacobian(F, [a, b, c]);

% ### Newton's method aplication -> deltaX = - inv(JF) * F (for each iteration) ### %

% the step each iteration takes
deltaX = [1000; 1000; 1000];  % init with big numbers to enter while loop

epsilon = 10^(-10);  % Condition to stop -> norm(deltaX) is less than epsilon

% initial values for the solution
a0 = 1;		
b0 = -5;
c0 = -0.5;
Xi = [a0; b0; c0];

i = 0; % iteration counter

while norm(deltaX) > epsilon

	fprintf('------- ITER: %d --------\n', i);
	i = i + 1;
    
	JF_Xi = double(subs(JF, {a, b, c}, {Xi.'}));
	F_Xi = double(subs(F, {a, b, c}, {Xi.'}));

	deltaX = - inv(JF_Xi) * F_Xi;
    fprintf('Norm: %f\n\n', norm(deltaX));
	Xi = Xi + deltaX;

end

fprintf('SOLUTION: a = %f | b = %f | c = %f\n', Xi(1), Xi(2), Xi(3));

% define a, b and c explicitely to be used in another script to plot
a = Xi(1);
b = Xi(2);
c = Xi(3);


