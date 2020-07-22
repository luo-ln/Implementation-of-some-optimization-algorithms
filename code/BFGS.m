function [iter_num, time, value] = BFGS(nprob,n, x, epsilon, max_iter)
% BFGS算法   2020.06.15
% @author: 豆奶
% 函数功能：实现BFGS算法    
% 输入：
% nprob: 问题编号，22或23或26 
% n: 维度
% x: 自变量x
% epsilon: int, 精度
% max_iter: 最大迭代次数
% 输出：
% iter_num: 迭代次数
% time: 计算时间
% value: 目标函数的梯度的模的最终值
t1=clock;       % 计时开始
% 步1：取初始点x0, 初始对称矩阵B0. 精度
if nargin==2
    x = initpt(n, nprob);
    epsilon = 1e-3;
    max_iter = 500;
end
B = eye(n); % 单位矩阵
% 步2：若f的梯度小于epsilon，得解x
if (norm(gradfcn(n, x, nprob))<=epsilon)
    value = norm(gradfcn(n, x, nprob));
    t2=clock;
    time = etime(t2,t1);
    return;
end
xk = x;
for k=0:max_iter
    % 步3：解线性方程组，得解dk.
    gx = gradfcn(n, xk, nprob);
    dk = -linsolve(B+0.1*eye(n), gx);  
    %dk = -pinv(B)*gx;  % (n, 1)   
    % 步4：由线性搜索确定步长alpha，这里采用Wolfe_Powell
    alpha = Wolfe_Powell(0.01, 0.6, 15, 0.8, 0.6, dk, n, xk, nprob); % step 4
    % 步5：更新xk，并判断是否满足终止条件，若不满足，则由BFGS修正公式确定Bk.
    xk1 = xk + alpha*dk;   % step 5
    gx1 = gradfcn(n, xk1, nprob);
    if (norm(gx1)<=epsilon)
        break;
    end
    % 利用秩2修正公式：课本54页的公式（4.13）
    sk = xk1 - xk; %alpha*dk;  % s_k= x_{k+1}-x_k = alpha*dk   % (n, 1)  xk1 - xk
    yk = gx1 - gx; % (n, 1)
    B = B - (B*(sk*sk')*B)/(sk'*B*sk) + (yk*yk')/(yk'*sk);
    xk = xk1; 
end
% 获取输出值
iter_num = k;
value = norm(gx1);
t2=clock;
time = etime(t2,t1);
%fprintf('问题编号\t\t运行次数\t\t运行时间\t\t\t最后的梯度\n');
fprintf('\t%2d\t\tBFGS算法\t\t%5d\t\t%2f\t\t%5d\n', nprob, iter_num, time, value);
return;
end