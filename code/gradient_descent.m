function [iter_num, time, value] = gradient_descent(nprob,n, x, epsilon, max_iter)
% 最速下降法   2020.06.15
% @author: 豆奶
% 函数功能：实现最速下降法
% 输入：
% nprob: 问题编号，21, 22, 23, 25, 26
% n: 维度
% x: 自变量x
% epsilon: int, 
% max_iter: 最大迭代次数
% 输出：
% iter_num: 迭代次数
% time: 计算时间
% value: 目标函数的梯度的模的最终值
t1=clock;   % 计时开始
% 步1：初始化初始点x，精度epsilon>0.
if nargin==2
    x = initpt(n, nprob);
    epsilon = 1e-3;
    max_iter = 500;
end
for iter_num = 0:max_iter
    % 步2：若f的梯度的模小于epsilon，终止算法. 得解xk. 否则，计算dk = -\nabla f(xk).
    if norm(gradfcn(n, x, nprob))<=epsilon
        break;
    end
    d = -gradfcn(n, x, nprob);
    %tic  
    % 步3：由线性搜索确定步长alpha，这里采用Wolfe_Powell型线性搜索.
    alpha = Wolfe_Powell(0.1, 0.9, 15, 0.2, 0.5, d, n, x, nprob); 
    %toc  %利用tic   toc可以计算程序运行时间
    % 步4：更新xk
    x = x + alpha*d; 
end
% 获取输出值
t2=clock;
value = norm(gradfcn(n, x, nprob));
time = etime(t2,t1);
%fprintf('问题编号\t\t运行次数\t\t运行时间\t\t\t最后的梯度\n');
fprintf('\t%2d\t\t最速下降法\t\t%5d\t\t%2f\t\t%5d\n', nprob, iter_num, time, value);
return;
end