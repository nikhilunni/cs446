%---------------PARAMS------------------------------%
perceptron_params = [1.5,0.25,0.25];
winnow_params = [1.1,1.1,1.1];
winnow_margin_params1 = [1.1,1.1,1.1];
winnow_margin_params2 = [0.3,2.0,0.04];
adagrad_params = [1.5,1.5,1.5];
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
    [w,theta] = perceptron(xTrain{i}, yTrain{i});
    acc = accuracy(w,theta,xTest{i},yTest{i});
    display(strcat('Perceptron',num2str(listM(i)),', acc = ',num2str(acc)));
end
%-------------------------------------------------%
 
%---------------Perceptron Margin---------------%
for i = 1:3
      [w,theta] = perceptron_margin(xTrain{i}, yTrain{i}, perceptron_params(i));
          acc = accuracy(w,theta,xTest{i},yTest{i});
          display(strcat('Perceptron_Margin',num2str(listM(i)),', acc = ',num2str(acc)));
end
%-----------------------------------------------%
 
 
%---------------Winnow---------------%
for i = 1:3
        [w,theta] = winnow(xTrain{i}, yTrain{i}, winnow_params(i));
        acc = accuracy(w,theta,xTest{i},yTest{i});
        display(strcat('Winnow',num2str(listM(i)),', acc = ',num2str(acc)));
end
%------------------------------------%
 
 
%---------------Winnow Margin---------------%
for i = 1:3
        [w,theta] = winnow_margin(xTrain{i}, yTrain{i}, winnow_margin_params1(i), winnow_margin_params2(i));
        acc = accuracy(w,theta,xTest{i},yTest{i});
        display(strcat('Winnow_Margin',num2str(listM(i)),', acc = ',num2str(acc)));
end
%-------------------------------------------%


%---------------Adagrad---------------%
for i = 1:3
        [w,theta] = adagrad(xTrain{i}, yTrain{i}, adagrad_params(i));
        acc = accuracy(w,theta,xTest{i},yTest{i});
        display(strcat('Adagrad',num2str(listM(i)),', acc = ',num2str(acc)));
end
%-------------------------------------%
