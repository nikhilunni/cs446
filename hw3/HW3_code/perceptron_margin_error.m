function [error] = perceptron_margin_error(x,y,eta)
    [m,n] = size(x);
    w = zeros(1,n);
    theta = 0;
    error = 0;
    for i = 1:m
        if (dot(w,x(i,:))+theta) * y(i) <= 0
           error = error + 1;
        end
        if (dot(w,x(i,:))+theta) * y(i) <= 1 %1 = gamma
            w = w + eta*y(i)*x(i,:);
            theta = theta + eta*y(i);
        end
    end
end
