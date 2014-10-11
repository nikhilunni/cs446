function [error] = winnow_R(x,y,alpha)
    [m,n] = size(x);
    w = ones(1,n);
    theta = -1*n;
    error = 0;
    streak = 0;
    R = 1000;
    
    while(streak < R)
        for i = 1:m
            if (dot(w,x(i,:))+theta) * y(i) <= 0
                error = error + 1;
                streak = 0;
                for k = 1:n
                    w(k) = w(k) * alpha^(y(i)*x(i,k));
                end
            else
                streak = streak + 1;
                if(streak >= R)
                    return;
                end
            end
        end
    end
end