%{
Plots the function:
	
	g(r) = a + b * exp(c * r)

Where the a, b, c values are obtained using the Least Squares Method for
the aproximation of a certain T = T(r) function.

From T we know the following 7 discrete values:

	ri ||  0 |  0.5  |  1    |  1.5  | 2    | 2.5  | 3    |
	Ti || -3 | -1.89 | -1.03 | -0.36 | 0.16 | 0.57 | 0.88 |

We obtain the optimal a, b, c values from the newton_nonlinear_equation_solver.m script.
So that program is called at the begining of this one.

This script also calculates the final error obtained for the Least Squares Method objective
function - min Q - (the function we try to optimize). This function is given by:
	
	         6                      6
	min Q = sum ( g(ri) - Ti )^2 = sum ( (a + b * exp(c * ri) - Ti)^2 )
	        i=0                    i=0
%}

% get the optimal a, b and c values from the other script
newton_nonlinear_equation_solver

fprintf('\n-------------------------------\n\n');

% define the discrete points known for T(r)
r = 0 : 0.5 : 3;
T = [-3, -1.89, -1.03, -0.36, 0.16, 0.57, 0.88];

% independent variable
x = -0.25 : 0.25 : 4;

% aproximating function
g = a + b * exp(c * x);

% aproximating function defined only for ri
g_ri = a + b * exp(c * r);

% create the figure
figure; hold on;

% plot the given points for T
plot(r, T, 'o');

% plot the best aproximation for the Least Squares method
% for this type function
plot(x, g);
hold off;

% calculates the squared deviations for each ri of the solution found
Q_vector = (g_ri - T).^2;

% calulates the value of the function Q we set to minimize using the Least Squares method
Q_min = sum(Q_vector);

for i = 1 : length(Q_vector)
	fprintf('ri: %-2.1f | Ti: %.3f | g(ri): %f | di^2: %f\n', r(i), T(i), g_ri(i), Q_vector(i));
end

fprintf('\nQ(a, b, c) = %.5f\n', Q_min);

