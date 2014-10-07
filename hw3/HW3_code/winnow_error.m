function [error] = winnow_error(x,y,alpha)
    [m,n] = size(x);
    w = ones(1,n);
    theta = -1*n;
    error = 0;

   for i = 1:m
     if (dot(w,x(i,:))+theta) * y(i) <= 0
        error = error + 1;
        for k = 1:n
            w(k) = w(k) * alpha^(y(i)*x(i,k));
        end
     end
   end
end