% 对无约束问题的测试文件. 算法的具体输入及含义可见算法实现
nprobs = [22 23 25];  % [21 22 23 25 26];
fprintf('问题编号\t\t使用的算法\t\t运行次数\t\t运行时间\t\t\t最后的梯度\n');
for nprob = nprobs
    gradient_descent(nprob, 100);
    BFGS(nprob, 100);
end
%% 绘图
% subplot(1,3,1);
% plot(sigma1s, iter_num,sigma1s, iter_num2);
% title('迭代次数随维度n的变化');
% xlabel('问题维度n');
% ylabel('迭代次数');
% lgd=legend('最速下降法','BFGS算法');
% set(lgd);
% subplot(1,3,2);
% plot(sigma1s, time,sigma1s, time2);
% title('运行时间随维度n的变化');
% xlabel('问题维度n');
% ylabel('运行时间');
% lgd=legend('最速下降法','BFGS算法');
% set(lgd);
% subplot(1,3,3);
% plot(sigma1s, value,sigma1s, value2);
% title('目标函数梯度的模随维度n');
% xlabel('问题维度n');
% ylabel('目标函数梯度的模');
% lgd=legend('最速下降法','BFGS算法');
% set(lgd);

% subplot(2,3,4);
% plot(sigma1s, iter_num2);
% title('迭代次数随问题维度n的变化');
% xlabel('问题维度n');
% ylabel('迭代次数');
% subplot(2,3,5);
% plot(sigma1s, time2);
% title('运行时间随问题维度n的变化');
% xlabel('问题维度n');
% ylabel('运行时间');
% subplot(2,3,6);
% plot(sigma1s, value2);
% title('目标函数梯度的模随问题维度n的变化');
% xlabel('问题维度n');
% ylabel('目标函数梯度的模');

% 按ctrl+r可以进行多行注释，按ctrl+t可以进行多行取消注释
% f=@(x)x.^2+2.*x+1;          %通过函数句柄建立匿名函数
% syms x;                     %通过符号变量将匿名函数转换为符号函数
% y=f(x);
% g=matlabFunction(diff(y));   %通过matlabFunction将符号函数转换为匿名函数

    