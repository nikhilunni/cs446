function [error] = perceptron_margin_R(x,y,eta)
    [m,n] = size(x);
    w = zeros(1,n);
    theta = 0;
    error = 0;
    streak = 0;
    R = 1000;
    while (streak < R)
        for i = 1:m
            if (dot(w,x(i,:))+theta) * y(i) <= 0
               error = error + 1;
               streak = 0;
            else
               streak = streak + 1;
               if(streak >= R)
                    return;
               end
            end
            if (dot(w,x(i,:))+theta) * y(i) <= 1 %1 = gamma
                w = w + eta*y(i)*x(i,:);
                theta = theta + eta*y(i);
            end
        end
    end
end