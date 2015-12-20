%{
Plots the function:
	
	g(r) = a + b * exp(c * r)

Where the a, b, c values are obtained using the Least Squares Method for
the aproximation of a certain T = T(r) function.

From T we know the following 7 discrete values:

	ri ||  0 |  0.5  |  1    |  1.5  | 2    | 2.5  | 3    |
	Ti || -3 | -1.89 | -1.03 | -0.36 | 0.16 | 0.57 | 0.88 |

We obtain the optimal a, b, c values from the newton_nonlinear_equation_solver.m script
So that program should be ran before this one.

This script also calculates the final error obtained for the Least Squares Method objective
function (the function we try to optimize). This function is given by:
	
	 6
	sum ( g(ri) - Ti )^2
	i=0
%}

% define the discrete points known for T(r)
ri = 0 : 0.5 : 3;
Ti = [-3, -1.89, -1.03, -0.36, 0.16, 0.57, 0.88];

% independent variable
r = -0.3 : 0.25 : 4;

% aproximating function
y = a + b * exp(c * r);

% create the figure
figure; hold on;

% plot the given points
plot(ri, Ti, 'o');

% plot the best aproximation for the Least Squares method
% for this type function
plot(r, y);




