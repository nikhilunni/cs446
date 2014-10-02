function [w,theta] = adagrad(x,y,eta)
    [m,n] = size(x);
    w = ones(1,n);
    theta = -1*n;
    for j = 1:20
       for i = 1:m
         if (dot(w,x(i,:))+theta) * y(i) <= 0
            g = [-y(i)*x(i), -y(i)];
         end
       end
    end
end
