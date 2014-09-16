% This function finds a linear discriminant using LP
% The linear discriminant is represented by 
% the weight vector w and the threshold theta.
% YOU NEED TO FINISH IMPLEMENTATION OF THIS FUNCTION.

function [w,theta,delta] = findLinearDiscriminant(data)
%% setup linear program
[m, np1] = size(data);
n = np1-1;

for i=1:m,
    if data(i,n+1) == -1
        data(i,:) = horzcat(data(i,1:n)*-1, data(i,n+1));
    end
end

A = vertcat( horzcat(data,ones(m,1)) , zeros(1,n+2) ); A(m+1 ,n+2)=1;
b = ones(m+1,1); b(m+1) = 0;
c = zeros(n+2,1); c(n+2) = 1;


%% solve the linear program
%adjust for matlab input: A*x <= b
[t, z] = linprog(c, -A, -b);

%% obtain w,theta,delta from t vector
w = t(1:n);
theta = t(n+1);
delta = t(n+2);


end
