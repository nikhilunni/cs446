function [error] = perceptron_margin_error(x,y,eta)
    [m,n] = size(x);
    w = zeros(1,n);
    theta = 0;
    error = zeros(1,500);
    totalError = 0;
    for i = 1:m
        if (dot(w,x(i,:))+theta) * y(i) <= 0
           totalError = totalError + 1;
        end
        if (dot(w,x(i,:))+theta) * y(i) <= 1 %1 = gamma
            w = w + eta*y(i)*x(i,:);
            theta = theta + eta*y(i);
        end
                   idx = floor((i-1)/100)+1;
           error(idx) = totalError;
    end
end
