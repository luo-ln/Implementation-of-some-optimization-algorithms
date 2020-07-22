function [iter_num, time, epsilonk] = method_of_multipliers(nprob, n, x, epsilon, max_iter)
% 乘子法   2020.06.25
% @author: 豆奶
% 函数功能：实现乘子法      
% 输入：
% nprob: 问题编号， 
% n: 维度
% x: 自变量x
% epsilon: int, 
% max_iter: 最大迭代次数
% 输出：
% iter_num: 迭代次数
% time: 计算时间
% epsilonk: KKT系统模的最终值

t1=clock;  % 计时开始
% 步0：取初始点x，初始乘子向量. 给定罚参数序列，精度
if nargin==2
    x = initpt(n, nprob);
    epsilon = 1e-5;
    max_iter = 100;  
end
mu = 0.5;
xk = x;
% 设置目标函数，约束函数
if strcmp(nprob, 'De_Jong')
    f = @(x) sum(x.^2);
    g1 =@(x) x+5.12;
    g2 =@(x) 5.12-x;
    g =@(x) [g1(x); g2(x)];
    h =@(x) 0;
    lambda_g = 10*ones(2*n, 1);  % (2n, 1)   和约束条件的个数有关
    lambda_h = 0;
elseif strcmp(nprob, 'Rastrigin')
    f = @(x)10*n + sum(x.^2 - 10*cos(2*pi*x));  
    g1 =@(x) x+5.12;
    g2 =@(x) 5.12-x;
    g =@(x) [g1(x); g2(x)];
    h =@(x) 0;
    lambda_g = ones(2*n, 1);  % (2n, 1)   和约束条件的个数有关
    lambda_h = 0;
end
for k=1:max_iter 
    % 步1：由（12.27）构造增广Lagrange函数L.
    L =@(x) f(x) + 0.5.*(1/mu)*sum(min(mu*g(x)-lambda_g, 0).^2-lambda_g.^2) - sum(lambda_h'*h(x)) + 0.5*mu*sum(h(x).^2);
    % 步2：以x_{k-1}作为初始点（k=0时，初始点任意），求解无约束问题L得解x_k.
    xk = fmincon(L, xk);
    % 步3：判断是否小于epsilon，以跳出循环.
    eps_k = norm(h(xk)) + norm(min(g(xk), 1/mu*lambda_g));
    if eps_k<=epsilon
        break;
    end 
    % 步4：在（12.28）中取x=xk, lambda=lambda_k
    lambda_g = max(lambda_g-mu*g(xk), 0);  % update lambda_g, i \in I
    lambda_h = lambda_h - mu*h(xk);        % update lambda_h, j \in E
end
% 获取输出值
iter_num = k;
syms x;                     %通过符号变量将匿名函数转换为符号函数
gxk = mu*g(xk) - lambda_g;  % 由于min无法直接求导，因此将这部分割裂开来，独自求导计算
%dg = diff(g(x));  % 由于本次测试采用的两个测试问题的g的导数均为实数，即(1,-1)，失去了自变量x，因此改为手动求导
dg = ones(2*n, 1);
dg(n+1:2*n) = -1;
gxk(gxk>0) = 0;
dgxk = gxk'*dg;
y = f(x) - sum(lambda_h'*h(x)) + 0.5*mu*sum(h(x).^2);   % y=L(x);
grad=matlabFunction(diff(y));   %通过matlabFunction将符号函数转换为匿名函数，并求导
epsilonk = [grad(xk)+dgxk; h(xk); min(g(xk),lambda_g)];   
epsilonk = norm(epsilonk);      
t2=clock;
time = etime(t2,t1);
fprintf('\t问题编号\t\t\t算法\t\t运行次数\t\t运行时间\t\t\tKKT残量\n');
fprintf('\t%s\t\t乘子法\t%5d\t\t%2f\t\t%5d\n', nprob, iter_num, time, epsilonk);
return;
end