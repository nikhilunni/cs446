%---------------PARAMS------------------------------%
perceptron_params = [1.5,0.25,0.03,0.005,0.001];
winnow_params = [1.1,1.01,1.005,1.0005,1.0001];
winnow_margin_params1 = [1.1,1.01,1.005,1.0005,1.0001];
winnow_margin_params2 = [2.0,0.3,0.04,0.006,0.001];
adagrad_params = [1.5,0.25,0.03,0.005,0.001];
%---------------------------------------------------%


%---------------DATA------------------------%
listM = [100,500,1000];
[yTrain{1},xTrain{1}] = gen(10,100,1000,50000,1);
[yTest{1},xTest{1}] = gen(10,100,1000,10000,0);

[yTrain{2},xTrain{2}] = gen(10,500,1000,50000,1);
[yTest{2},xTest{2}] = gen(10,500,1000,10000,0);

[yTrain{3},xTrain{3}] = gen(10,1000,1000,50000,1);
[yTest{3},xTest{3}] = gen(10,1000,1000,10000,0);
%-------------------------------------------%


%---------------Perceptron------------------------%
for i = 1:3
    [w,theta] = perceptron(xTrain{i}(1:5000,:), yTrain{i}(1:5000,:));
    acc = accuracy(w,theta,xTrain{i}(5000:10000,:),yTrain{i}(5000:10000,:));
    display(strcat('Perceptron',num2str(listM(i)),', acc = ',num2str(acc)));
end
%-------------------------------------------------%

%---------------Perceptron Margin---------------%
for i = 1:3
    for eta = perceptron_params;
        [w,theta] = perceptron_margin(xTrain{i}(1:5000,:), yTrain{i}(1:5000,:), eta);
        acc = accuracy(w,theta,xTrain{i}(5000:10000,:),yTrain{i}(5000:10000,:));
        display(strcat('Perceptron_Margin',num2str(listM(i)),' : eta = ',num2str(eta),', acc = ',num2str(acc)));
    end
end
%-----------------------------------------------%


%---------------Winnow---------------%
for i = 1:3
    for alpha = winnow_params;
        [w,theta] = winnow(xTrain{i}(1:5000,:), yTrain{i}(1:5000,:), alpha);
        acc = accuracy(w,theta,xTrain{i}(5000:10000,:),yTrain{i}(5000:10000,:));
        display(strcat('Winnow',num2str(listM(i)),' : alpha = ',num2str(alpha),', acc = ',num2str(acc)));
    end
end
%------------------------------------%


%---------------Winnow Margin---------------%
for i = 1:3
    for alpha = winnow_margin_params1
        for gamma = winnow_margin_params2
            [w,theta] = winnow_margin(xTrain{i}(1:5000,:), yTrain{i}(1:5000,:), alpha, gamma);
            acc = accuracy(w,theta,xTrain{i}(5000:10000,:),yTrain{i}(5000:10000,:));
            display(strcat('Winnow_Margin',num2str(listM(i)),' : alpha = ',num2str(alpha),' gamma = ',num2str(gamma),', acc = ',num2str(acc)));
        end
    end
end
%-------------------------------------------%


%---------------Adagrad---------------%
for i = 1:3
    for eta = adagrad_params;
        [w,theta] = adagrad(xTrain{i}(1:5000,:), yTrain{i}(1:5000,:), eta);
        acc = accuracy(w,theta,xTrain{i}(5000:10000,:),yTrain{i}(5000:10000,:));
        display(strcat('Adagrad',num2str(listM(i)),' : eta = ',num2str(eta),', acc = ',num2str(acc)));
    end
end
%-------------------------------------%


