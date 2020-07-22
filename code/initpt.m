function [x] = initpt(n, nprob)
% 初始化x  2020.06.15
% @author: 豆奶
% 函数功能：生成初始点
% 输入：
% n: 维度
% nprob: 问题编号，21或其他
% 输出：
% x: 初始点x0
x = ones(n, 1); % (n, 1)大小的向量
if nprob==21
    x(1:2:n) = -1.2;
elseif nprob==22
    x(1:2:n) = 3;
    x(2:2:n) = -1;
    x(3:2:n) = 0;
elseif nprob==23
    x = 1:n;
    x = x';
elseif nprob==26
    x = x/n;
elseif nprob==25
    x = 1:n;
    x = 1 - x'/n;
elseif strcmp(nprob, 'Griewank')   % 约束问题
    x = ones(n, 1);
elseif strcmp(nprob, 'De_Jong')   % 约束问题
    x = ones(n, 1);  % 5*
elseif strcmp(nprob, 'Rastrigin')   % 约束问题
    x = ones(n, 1);   % 当这里设置为5*的时候，好像不会收敛到0，而是收敛到-3.9798，可能这里也有一个最小值吧，5.12对F_W算法最优
end
end