%---------------OPTIMAL PARAMS--------------%
perceptron_margin_params =  [1.5,1.5,0.03,0.03,0.03];
winnow_params =             [1.1,1.1,1.1,1.1,1.1];
winnow_margin_params1 =     [1.1,1.1,1.1,1.1,1.1];
winnow_margin_params2 =     [1.5,1.5,1.5,1.5,1.5];
adagrad_params =            [1.5,1.5,1.5,1.5,1.5];
%-------------------------------------------%


%---------------DATA------------------------%
listN = [40,80,120,160,200];
[y40,x40] = gen(10,20,40,50000,0);
[y80,x80] = gen(10,20,80,50000,0);
[y120,x120] = gen(10,20,120,50000,0);
[y160,x160] = gen(10,20,160,50000,0);
[y200,x200] = gen(10,20,200,50000,0);

X{1} = x40; X{2} = x80; X{3} = x120; X{4} = x160; X{5} = x200;
Y{1} = y40; Y{2} = y80; Y{3} = y120; Y{4} = y160; Y{5} = y200;

w_perceptron =          zeros(1,5);
w_perceptron_margin =   zeros(1,5);
w_winnow =              zeros(1,5);
w_winnow_margin =       zeros(1,5);
w_adagrad =             zeros(1,5);
%-------------------------------------------%



%---------------Perceptron---------------%
for i = 1:5
    w_perceptron(i) = perceptron_R(X{i},Y{i});
end
%----------------------------------------%

%---------------Perceptron Margin---------------%
for i = 1:5
    w_perceptron_margin(i) = perceptron_margin_R(X{i},Y{i},perceptron_margin_params(i));
end
%-----------------------------------------------%


%---------------Winnow---------------%
for i = 1:5
    w_winnow(i) = winnow_R(X{i},Y{i},winnow_params(i));
end
%------------------------------------%

%---------------Winnow Margin---------------%
for i = 1:5
    w_winnow_margin(i) = winnow_margin_R(X{i},Y{i},winnow_margin_params1(i),winnow_margin_params2(i));
end
%-------------------------------------------%


%---------------Adagrad---------------%
for i = 1:5
    w_adagrad(i) = adagrad_R(X{i},Y{i},adagrad_params(i));
end
%-------------------------------------%


figure
hold on
title('Problem 2')
xlabel('n')
ylabel('Mistakes')
plot(listN,w_perceptron,listN,w_perceptron_margin,listN,w_winnow,listN,w_winnow_margin,listN,w_adagrad);
legend('Perceptron','Peceptron with Margin','Winnow','Winnow with Margin','Adagrad');
legend('Location','NorthWest');
hold off


