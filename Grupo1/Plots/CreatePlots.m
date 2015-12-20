path(path, '..'); %add the main folder to the path
Ex1Fun; %define the function for the exercise

if ~exist('./images','dir')
    mkdir('images');
end

% plot the all the zeros of the function
fig = figure;
PlotFun(h, -2.3e+4, +2.3e+4);
saveas(fig, 'images\func-all.jpg');

%plot the positive zeros of the fuction
fig = figure;
PlotFun(h, 0, +2.3e+4);
saveas(fig, 'images\func-pos.jpg');

%plot the first positive zero of the function
fig = figure;
PlotFun(h, 140, 180);
saveas(fig, 'images\func-pos1.jpg');

%plot the second positive zero of the function
fig = figure;
PlotFun(h, 2.1e+4, 2.12e+4);
saveas(fig, 'images\func-pos2.jpg');