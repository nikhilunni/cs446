numN = 50000;
skip = 100;
N = skip:skip:numN;


numElements = size(N);
numElements = numElements(2); %I hate Matlab...


[y1,x1] = gen(10,100,500,50000,0);
[y2,x2] = gen(10,100,1000,50000,0);


w_perceptron1 = perceptron_error(x1,y1);
w_perceptron2 = perceptron_error(x2,y2);

w_perceptron_margin1 = perceptron_margin_error(x1,y1,0.005);
w_perceptron_margin2 = perceptron_margin_error(x2,y2,0.25);

w_winnow1 = winnow_error(x1,y1,1.1);
w_winnow2 = winnow_error(x2,y2,1.1);

w_winnow_margin1 = winnow_margin_error(x1,y1,1.1,0.006);
w_winnow_margin2 = winnow_margin_error(x2,y2,1.1,0.04);

w_adagrad1 = adagrad_error(x1,y1,1.5);
w_adagrad2 = adagrad_error(x2,y2,1.5);



figure
hold on
title('n = 500')
xlabel('N')
ylabel('Mistakes')
plot(N,w_perceptron1,N,w_perceptron_margin1,N,w_winnow1,N,w_winnow_margin1,N,w_adagrad1);
legend('Perceptron','Peceptron with Margin','Winnow','Winnow with Margin','Adagrad');
legend('Location','NorthWest');
hold off

figure
hold on
title('n = 1000')
xlabel('N')
ylabel('Mistakes')
plot(N,w_perceptron2,N,w_perceptron_margin2,N,w_winnow2,N,w_winnow_margin2,N,w_adagrad2);
legend('Perceptron','Peceptron with Margin','Winnow','Winnow with Margin','Adagrad');
legend('Location','NorthWest');
hold off