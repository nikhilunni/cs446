perceptron_params = [1.5,0.25,0.03,0.005,0.001];
winnow_params = [1.1,1.01,1.005,1.0005,1.0001];
winnow_margin_params1 = [1.1,1.01,1.005,1.0005,1.0001];
winnow_margin_params2 = [2.0,0.3,0.04,0.006,0.001];
adagrad_params = [1.5,0.25,0.03,0.005,0.001];

listN = [40,80,120,160,200];
[y40,x40] = gen(10,20,40,50000,0);
[y80,x80] = gen(10,20,80,50000,0);
[y120,x120] = gen(10,20,120,50000,0);
[y160,x160] = gen(10,20,160,50000,0);
[y200,x200] = gen(10,20,200,50000,0);

X{1} = x40(1:5000,:); X{2} = x80(1:5000,:); X{3} = x120(1:5000,:); X{4} = x160(1:5000,:); X{5} = x200(1:5000,:); %Training X
X{6} = x40(5000:10000,:); X{7} = x80(5000:10000,:); X{8} = x120(5000:10000,:); X{9} = x160(5000:10000,:); X{10} = x200(5000:10000,:); %Test X

Y{1} = y40(1:5000,:); Y{2} = y80(1:5000,:); Y{3} = y120(1:5000,:); Y{4} = y160(1:5000,:); Y{5} = y200(1:5000,:); %Training Y
Y{6} = y40(5000:10000,:); Y{7} = y80(5000:10000,:); Y{8} = y120(5000:10000,:); Y{9} = y160(5000:10000,:); Y{10} = y200(5000:10000,:); %Test Y




for i = 1:5
    for eta = perceptron_params
        [w,theta] = perceptron_margin(X{i},Y{i},eta);
        acc = accuracy(w,theta,X{i+5},Y{i+5});
        display(strcat('Perceptron_Margin',num2str(listN(i)),' : eta = ',num2str(eta),', acc = ',num2str(acc)));
    end
end

for i = 1:5
    for alpha = winnow_params
        [w,theta] = winnow(X{i},Y{i},alpha);
        acc = accuracy(w,theta,X{i+5},Y{i+5});
        display(strcat('Winnow',num2str(listN(i)),' : alpha = ',num2str(alpha),', acc = ',num2str(acc)));        
    end
end

for i = 1:5
    for alpha = winnow_margin_params1
        for gamma = winnow_margin_params2
            [w,theta] = winnow_margin(X{i},Y{i},alpha,gamma);
            acc = accuracy(w,theta,X{i+5},Y{i+5});            
            display(strcat('Winnow_Margin',num2str(listN(i)),' : alpha = ',num2str(alpha),', gamma =',num2str(gamma),', acc = ',num2str(acc)));
        end
    end
end

for i = 1:5
    for eta = adagrad_params
        [w,theta] = adagrad(X{i},Y{i},eta);
        acc = accuracy(w,theta,X{i+5},Y{i+5});
        display(strcat('Adagrad',num2str(listN(i)),' : eta = ',num2str(eta),', acc = ',num2str(acc)));
    end
end