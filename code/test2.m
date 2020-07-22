% 对约束问题的测试函数，对于每个算法的输入，可查看算法实现
%% 利用乘子法求解De Jong's function
method_of_multipliers('De_Jong', 20);
%% 利用Frank Wolfe算法求解De Jong's function
Frank_Wolfe('De_Jong', 20);
%% 利用乘子法求解Rastrigin's function
method_of_multipliers('Rastrigin', 20);
%% 利用Frank Wolfe算法求解Rastrigin's function
Frank_Wolfe('Rastrigin', 20);

%% 绘图
% sigma1s = 20:20:120;
% iter_num = 20:20:120;  time = 20:20:120; value = 20:20:120;
% iter_num2 = 20:20:120;  time2 = 20:20:120; value2= 20:20:120;
% i=1;
% for sigma1 = sigma1s
%     nprob = 'Rastrigin';
%     [iter_num(i), time(i), value(i)] = method_of_multipliers(nprob, sigma1);
%     [iter_num2(i), time2(i), value2(i)] = Frank_Wolfe(nprob, sigma1);
%     i = i+1;
% end
% subplot(1,3,1);
% plot(sigma1s, iter_num,sigma1s, iter_num2);
% title('迭代次数随维度n的变化');
% xlabel('问题维度n');
% ylabel('迭代次数');
% legend('乘子法','Frank_Wolfe算法');
% subplot(1,3,2);
% plot(sigma1s, time,sigma1s, time2);
% title('运行时间随维度n的变化');
% xlabel('问题维度n');
% ylabel('运行时间');
% legend('乘子法','Frank_Wolfe算法');
% subplot(1,3,3);
% plot(sigma1s, value,sigma1s, value2);
% title('目标函数梯度的模随维度n');
% xlabel('问题维度n');
% ylabel('目标函数梯度的模');
% legend('乘子法','Frank_Wolfe算法');
