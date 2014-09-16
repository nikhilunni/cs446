% This function solves the LP problem for a given weight vector
% to find the threshold theta.
% YOU NEED TO FINISH IMPLEMENTATION OF THIS FUNCTION.

function [theta,delta] = findLinearThreshold(data,w)
%% setup linear program
[m, np1] = size(data);
n = np1-1;

A = zeros(m,2);
b = zeros(m,1);
c = [0,1];

for i=1:m,
    if data(i,n+1) == -1
        A(i,:) = [-1,1];
        b(i,:) = 1 + dot(w,data(i,1:n));
    elseif data(i,n+1) == 1
        A(i,:) = [1,1];
        b(i,:) = 1 - dot(w,data(i,1:n));
    end         
end

A = vertcat(A, [0,1]);
b = vertcat(b, 0);



%% solve the linear program
%adjust for matlab input: A*x <= b
[t, z] = linprog(c, -A, -b);

theta = t(1);
delta = t(2);
%% make sure you return theta and delta properly.

end
