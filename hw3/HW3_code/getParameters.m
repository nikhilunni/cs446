

perceptron_params = [1.5,0.25,0.03,0.005,0.001];
winnow_params = [1.1,1.01,1.005,1.0005,1.0001];
winnow_margin_params1 = [1.1,1.01,1.005,1.0005,1.0001];
winnow_margin_params2 = [2.0,0.3,0.04,0.006,0.001];
adagrad_params = [1.5,0.25,0.03,0.005,0.001];

[y1,x1] = gen(10,100,500,50000,0);
[y2,x2] = gen(10,100,1000,50000,0);

y1_train = y1(1:5000,:); y2_train = y2(1:5000,:);
x1_train = x1(1:5000,:); x2_train = x2(1:5000,:);

y1_test = y1(5001:10000,:); y2_test = y2(5001:10000,:);
x1_test = x1(5001:10000,:); x2_test = x2(5001:10000,:);



% for eta = perceptron_params
%     [w1,theta1] = perceptron_margin(x1_train,y1_train,eta);
%     [w2,theta2] = perceptron_margin(x2_train,y2_train,eta);
%     acc1 = accuracy(w1,theta1,x1_test,y1_test);
%     acc2 = accuracy(w2,theta2,x2_test,y2_test);
%     display(strcat('Perceptron_Margin1 : eta = ',num2str(eta),', acc = ',num2str(acc1)));
%     display(strcat('Perceptron_Margin2 : eta = ',num2str(eta),', acc = ',num2str(acc2)))
% end
% 
% for alpha = winnow_params
%     [w1,theta1] = winnow(x1_train,y1_train,alpha);
%     [w2,theta2] = winnow(x2_train,y2_train,alpha);    
%     acc1 = accuracy(w1,theta1,x1_test,y1_test);
%     acc2 = accuracy(w2,theta2,x2_test,y2_test);
%     display(strcat('Winnow1 : alpha = ',num2str(alpha),', acc = ',num2str(acc1)));
%     display(strcat('Winnow2 : alpha = ',num2str(alpha),', acc = ',num2str(acc2)));
% end
% 
% for alpha = winnow_margin_params1
%     for gamma = winnow_margin_params2
%         [w1,theta1] = winnow_margin(x1_train,y1_train,alpha,gamma);
%         [w2,theta2] = winnow_margin(x2_train,y2_train,alpha,gamma);
%         acc1 = accuracy(w1,theta1,x1_test,y1_test);
%         acc2 = accuracy(w2,theta2,x2_test,y2_test);
%         display(strcat('Winnow_Margin1 : alpha = ',num2str(alpha),', gamma =',num2str(gamma),', acc = ',num2str(acc1)));
%         display(strcat('Winnow_Margin2 : alpha = ',num2str(alpha),', gamma =',num2str(gamma),', acc = ',num2str(acc2)));
%     end
% end

for eta = adagrad_params
    [w1,theta1] = adagrad(x1_train,y1_train,eta);
    [w2,theta2] = adagrad(x2_train,y2_train,eta);
    acc1 = accuracy(w1,theta1,x1_test,y1_test);
    acc2 = accuracy(w2,theta2,x2_test,y2_test);
    display(strcat('Adagrad1 : eta = ',num2str(eta),', acc = ',num2str(acc1)));
    display(strcat('Adagrad2 : eta = ',num2str(eta),', acc = ',num2str(acc2)));
end