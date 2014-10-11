function [error] = perceptron_R(x,y)
    [m,n] = size(x);
    w = zeros(1,n);
    theta = 0;
    error = 0;
    eta = 1;
    R = 1000;
    streak = 0;
    
    while streak < R
        for i = 1:m
            if (dot(w,x(i,:))+theta) * y(i) <= 0
                streak = 0;
                error = error + 1;
                w = w + eta*y(i)*x(i,:);
                theta = theta + eta*y(i);
            else
                streak = streak + 1;
                if (streak >= R)
                    return;
                end
            end
        end
    end
end
