function [w,theta] = perceptron_bonus(x,y)
    eta = 1;
    [m,n] = size(x);
    w = zeros(1,n);
    theta = 0;
    
    gamma1 = 0;
    gamma2 = 1;
    
    for j = 1:20
       for i = 1:m
         if(y(i) < 0) %Negative example
             if (dot(w,x(i,:))+theta) * y(i) <= gamma1
                w = w + eta*y(i)*x(i,:);
                theta = theta + eta*y(i);
             end
         else %Positive example
             if (dot(w,x(i,:))+theta) * y(i) <= gamma2
                w = w + eta*y(i)*x(i,:);
                theta = theta + eta*y(i);
             end
         end
       end
    end    
end