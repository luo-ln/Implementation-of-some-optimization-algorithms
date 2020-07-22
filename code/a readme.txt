文件说明：总共有10个m文件，可分为以下三部分：

1. 算法实现主函数(4个)
gradient_descent.m : 是实现梯度下降法的m文件
BFGS.m : 是实现BFGS算法的m文件
method_of_multipliers.m : 是实现乘子法的m文件
Frank_Wolfe.m : 是实现Frank Wolfe算法的m文件

2. 算法实现辅助函数(4个)
initpt.m : 用于初始化x的函数
objfcn.m : 是求解测试问题的函数值的函数
gradfcn.m : 是求解测试问题的梯度向量的函数
Wolfe_Powell.m: 实现了Wolfe_Powell型线性搜索，用于求解alpha

3. 测试文件(2个)
test.m: 用于测试无约束问题
test2.m: 用于测试约束问题
