function [alpha] = Wolfe_Powell(sigma1, sigma2, beta, rho, rho1, d, n, x, nprob)
% Wolfe Powell算法   2020.06.15
% @author: 豆奶
% 函数功能：实现Wolfe_Powell型线性搜索，根据输入x，输出alpha
% 输入说明：
% sigma1(0, 0.5), sigma2(sigma1, 1), beta(0,), rho(0,1), rho1(0,1): 常数
% d: 下降方向
% n: 维度
% x: 自变量x
% nprob: 问题编号
% 输出说明： 
% alpha: 步长
fk = objfcn(n, x, nprob);
gfk = gradfcn(n, x, nprob);
alpha = 1;
t1 = objfcn(n, x+alpha*d, nprob)<=(fk + sigma1*alpha*gfk'*d);
t2 = gradfcn(n, x+alpha*d, nprob)'*d>=sigma2*gfk'*d;
% 步0：若alpha=1满足（2.7），则取alpha=1; 否则转下一步.
if t1&&t2
    return;
end
i = 0;
% 步1：令alpha是集合中使得(2.7)中第一个不等式成立的最大者. i=0.
while(1)
    ak = beta*rho^i;
    t1 = (objfcn(n, x+ak*d, nprob)<=fk + sigma1*ak*gfk'*d);
    if t1  % 如果beta*rho^i成立，则观察i-1是否成立，若不成立，则说明这个i是使第一个不等式成立的最大的i；若成立，则继续循环，找到更大的i
        i = i-1;
        tempa = beta*rho^i; 
        t1 = (objfcn(n, x+tempa*d, nprob)<=fk + sigma1*tempa*gfk'*d);
        if ~t1
            break;
        end
    else  % 如果beta*rho^i不成立，则ak可能太大了，应该增大i，使得ak减小
        i = i+1;
    end
end
i=0;
step=2;
while(i<1000)
    % 步2：若alpha_k满足(2.7)中的第二个不等式，则终止计算，并得步长alpha；否则，令beta=alpha/rho，转步3.
    if(step==2)
        t2 = (gradfcn(n, x+ak*d, nprob)'*d>=sigma2*gfk'*d);
        if(t2)
            alpha = ak;
            return;
        end
        betai = ak/rho;
        step = 3;
        j = 0;
        ak1 = ak;
    % 步3：令alpha是集合中使得（2.7）中第一个不等式成立的最大者.令i=i+1，转步2.
    else
        t1 = (objfcn(n, x+ak1*d, nprob)<=fk + sigma1*ak1*gfk'*d);
        if t1   % 若能使第一个不等式成立，转步2
            step=2;
            i = i+1;
            ak = ak1;
        else    % 否则继续循环
            ak1 = ak + rho1^j*(betai - ak);
            j = j+1;
        end
    end
end
alpha = 0.02;   % 若超过最大循环次数仍未得到合适的alpha，则返回该值.
        


