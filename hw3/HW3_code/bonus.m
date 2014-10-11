% listM = [100,500,1000];
% [yTrain{1},xTrain{1}] = unba_gen(10,100,1000,50000,0.1);
% [yTrain{2},xTrain{2}] = unba_gen(10,500,1000,50000,0.1);
% [yTrain{3},xTrain{3}] = unba_gen(10,1000,1000,500000,0.1);
% 
% [yTest{1},xTest{1}] = unba_gen(10,100,1000,10000,0.1);
% [yTest{2},xTest{2}] = unba_gen(10,500,1000,10000,0.1);
% [yTest{3},xTest{3}] = unba_gen(10,1000,1000,10000,0.1);


for i = 3:3
    [w1,theta1] = perceptron(xTrain{i}, yTrain{i});
    acc1 = accuracy(w1,theta1,xTest{i},yTest{i});
    display(strcat('Perceptron',num2str(listM(i)),', acc = ',num2str(acc1)));
    
    
    [w2,theta2] = perceptron_bonus(xTrain{i}, yTrain{i});
    acc2 = accuracy(w2,theta2,xTest{i},yTest{i});
    display(strcat('Modified Perceptron',num2str(listM(i)),', acc = ',num2str(acc2)));    
end


