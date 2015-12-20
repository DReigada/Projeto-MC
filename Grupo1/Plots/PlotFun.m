function PlotFun( f, max, min)
%PlotEx1 Plot the function given and a line with y = 0

xvals = [max, min]; %define the interval to plot

fplot(f,xvals);
hold on;
fplot('0', xvals);
hold on;
xlabel('\omega (rads/s)');
end

