function [error] = adagrad_R(x,y,eta)
    [m,n] = size(x); %m = #examples, n = #features
    w = [ones(1,n),-1*n];
    G = zeros(1,n+1);
    error = 0;
    streak = 0;
    R = 1000;
    
    for i = 1:m
        if (dot(w(1:n),x(i,:))+w(n+1)) * y(i) <= 0
            error = error +1;
            streak = 0;
        else
            streak = streak + 1;
            if(streak >= R)
                return;
            end
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
    end
end