numN = 50000;
skip = 100;
N = skip:skip:numN;
numElements = size(N);
numElements = numElements(2); %I hate Matlab...
w_perceptron_margin1 = zeros(1,numElements);
w_perceptron_margin2 = zeros(1,numElements);

w_winnow1 = zeros(1,numElements);
w_winnow2 = zeros(1,numElements);

w_winnow_margin1 = zeros(1,numElements);
w_winnow_margin2 = zeros(1,numElements);

w_adagrad1 = zeros(1,numElements);
w_adagrad2 = zeros(1,numElements);
for i = N
    [y1,x1] = gen(10,100,500,i,0);
    [y2,x2] = gen(10,100,1000,i,0);
    w_perceptron_margin1(i/skip) = perceptron_margin_error(x1,y1,0.005);
    w_perceptron_margin2(i/skip) = perceptron_margin_error(x2,y2,0.25);
    
    w_winnow1(i/skip) = winnow_error(x1,y1,1.1);
    w_winnow2(i/skip) = winnow_error(x2,y2,1.1);
    
    w_winnow_margin1(i/skip) = winnow_margin_error(x1,y1,1.1,0.006);
    w_winnow_margin2(i/skip) = winnow_margin_error(x2,y2,1.1,0.04);
    
    w_adagrad1(i/skip) = adagrad_error(x1,y1,1.5);
    w_adagrad2(i/skip) = adagrad_error(x2,y2,1.5);
end



figure
hold on
title('Peceptron with Margin')
xlabel('N')
ylabel('Mistakes')
plot(N,w_perceptron_margin1,'blue',N,w_perceptron_margin2,'red');
legend('n=500','n=1000');
legend('Location','NorthWest');
hold off

figure 
hold on
title('Winnow')
xlabel('N')
ylabel('Mistakes')
plot(N,w_winnow1,'blue',N,w_winnow2,'red');
legend('n=500','n=1000');
legend('Location','NorthWest');
hold off

figure
hold on
title('Winnow with Margin')
xlabel('N')
ylabel('Mistakes')
plot(N,w_winnow_margin1,'blue',N,w_winnow_margin2,'red');
legend('n=500','n=1000');
legend('Location','NorthWest');
hold off

figure 
hold on
title('Adagrad')
xlabel('N')
ylabel('Mistakes')
plot(N,w_adagrad1,'blue',N,w_adagrad2,'red');
legend('n=500','n=1000');
legend('Location','NorthWest');
hold off