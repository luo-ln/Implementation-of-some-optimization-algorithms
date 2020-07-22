function [iter_num, time, epsilonk] = Frank_Wolfe(nprob, n, x, epsilon, max_iter)
% Frank Wolfe算法   2020.06.25
% @author: 豆奶
% 函数功能：实现Frank Wolfe法   
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
t1=clock;   % 计时开始
if nargin==2
    % 步0：取初始点x和精度epsilon
    x = initpt(n, nprob);  % 选取初始点要注意在可行域内 
    epsilon = 0.0001;
    max_iter = 100;
end
xk = x;
% 设置目标函数，约束函数
if strcmp(nprob, 'De_Jong')
    f = @(x) sum(x.^2);
    df = @(x) 2.*x;
    g1 =@(x) x+5.12;
    g2 =@(x) 5.12-x;
    g =@(x) [g1(x); g2(x)];
    h =@(x) 0;
elseif strcmp(nprob, 'Rastrigin')
    f = @(x)10*n + sum(x.^2 - 10*cos(2*pi*x));   % n为常量
    df = @(x) 2*x + 20*pi*sin(2*pi*x);   % f 的导数
    g1 =@(x) 5.12+x;
    g2 =@(x) 5.12-x;
    g =@(x) [g1(x); g2(x)];
    h =@(x) 0;
end
syms t;
for k=0:max_iter
    dfx = df(xk);
    lb = -5.12*ones(n, 1);
    ub = 5.12*ones(n, 1);
    % 步1：利用matlab的linprog函数求解线性规划问题（13.8）得y
    % 参数说明： linprog(f,A,b,Aeq,beq,LB,UB, X0)  
    y = linprog(dfx,[],[],[],[],lb,ub);% 这里要改（6.22）, 改好了（6.22）
    d = y - xk;
    % 步2：判断是否满足终止条件
    if norm(dfx'*d)/(1+norm(f(xk)))<epsilon
        break;
    end
    % 步3：利用matlab的fmincon函数求解线性搜索确定步长t
    ft = matlabFunction(f(xk+t*d));  %通过matlabFunction将符号函数转换为匿名函数，因为fmincon的第一个输入是匿名函数
    % 参数说明： fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options) %最后两个输入这里不需要
    [t_ans] = fmincon(ft,0.5,[],[],[],[],0,1);  % 这里要改（6.21）  改好了（6.22）
    xk = xk + t_ans*d;   
end
% 获取输出值
iter_num = k;
lambda_g = zeros(2*n, 1);  % 由于Frank_Wolfe算法没有用到lagrange函数，故lambda设为0
epsilonk = [df(xk); h(xk); min(g(xk), lambda_g)]; 
epsilonk = norm(epsilonk); 
% 输出看看效果
%fprintf('\ndf: %5d,   h: %5d,   g: %5d,   xk: %5d\n\n', norm(df(xk)), norm(h(xk)), norm(g(xk)), norm(xk));
t2=clock;
time = etime(t2,t1);
fprintf('\t问题名称\t\t\t算法\t\t运行次数\t\t运行时间\t\t\tKKT系统残量\n');
fprintf('\t%s\t\tFrank_Wolfe\t%5d\t\t%2f\t\t%5d\n', nprob, iter_num, time, epsilonk);
return;
end