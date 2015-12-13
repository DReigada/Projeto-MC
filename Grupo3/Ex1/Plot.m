path(path, '..');

%create the directory if it did not exist already
if ~exist('./images','dir')
    mkdir('images');
end

%save the plots of the legendre polynomials of order 1:10
for n = 1:10
    fig = figure('Visible','off');
    leg = @(x) Legendre(n,x);   %the polynimial to plot
    fplot(leg, [-1, 1]);    %plot the polynomial
    hold on;
    fplot('0', [-1, 1]);    %plot the constant function y = 0
    saveas(fig, sprintf('images\\legendre-ord%d.jpg', n));  %save the image
end 
