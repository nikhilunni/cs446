function [error] = winnow_error(x,y,alpha)
    [m,n] = size(x);
    w = ones(1,n);
    theta = -1*n;
    error = zeros(1,500);
    totalError = 0;

   for i = 1:m
     if (dot(w,x(i,:))+theta) * y(i) <= 0
        totalError = totalError + 1;

        for k = 1:n
            w(k) = w(k) * alpha^(y(i)*x(i,k));
        end
     end
             idx = floor((i-1)/100)+1;
        error(idx) = totalError;
   end
end