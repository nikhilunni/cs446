% This function plots the linear discriminant.
% YOU NEED TO IMPLEMENT THIS FUNCTION

function plot2dSeparator(w, theta)
    x = linspace(-2,2,100);
    y = (-theta-w(1)*x)/w(2);
    plot(x,y);
end
