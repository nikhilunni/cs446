function [w,theta] = winnow_margin(x,y,alpha,gamma)
    [m,n] = size(x);
    w = ones(1,n);
    theta = -1*n;
    for j = 1:20
       for i = 1:m
         if (dot(w,x(i,:))+theta) * y(i) <= gamma
            for k = 1:n
                w(k) = w(k) * alpha^(y(i)*x(i,k));
            end
         end
       end
    end
end
