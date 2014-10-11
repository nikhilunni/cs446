function [error] = adagrad_error(x,y,eta)
    [m,n] = size(x); %m = #examples, n = #features
    w = [ones(1,n),-1*n];
    G = zeros(1,n+1);
    error = zeros(1,500);
    totalError = 0;
    
   for i = 1:m
     if (dot(w(1:n),x(i,:))+w(n+1)) * y(i) <= 0
         totalError = totalError + 1;

     end
     if (dot(w(1:n),x(i,:))+w(n+1)) * y(i) <= 1
        g = [-y(i)*x(i,:), -y(i)];           
        G = G + g.^2;
        for k = 1:n
            if(G(k) ~= 0)                  
               w(k) = w(k) - eta*g(k)/sqrt(G(k));
            end

        end
     end
              idx = floor((i-1)/100)+1;
         error(idx) = totalError;
   end
    w_out = w(1:n);
    theta_out = w(n+1);
    
end