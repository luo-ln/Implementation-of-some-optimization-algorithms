# Implementation-of-some-optimization-algorithms
4个最优化算法的matlab实现

## 简介
本文针对要求解的优化问题（具体问题可见report中的附录1,2），实现了四个常用的最优化算法，包括两个无约束极小值算法——最速下降法(gradient descent method)和BFGS算法(BFGS algorithm)，两个约束极小值算法——乘子法(Multiplier method)和Frank Wolfe算法(Frank Wolfe algorithm)，
通过对测试问题的测试，验证了实现的成果，并进行总结写入report中.  
本文实现的算法目的是为求解测试函数中的最优化问题，因此，所实现的算法中，并没有将函数权柄作为参数传入，而是采用问题编号的形式实现. 所测试的问题具体可见report中的附录部分.  

## 文件夹说明
1. code文件夹：里面包含了本次实现的代码，共有11个文件，具体可见文件夹中的a readme.txt，里面简述了每个函数的功能
2. report文件夹: 里面包含了对本次算法实现的测试数值结果报告.

## 代码运行环境说明
本次使用的语言：matlab


如有错误或不足之处，还请指出！  

                                                             2020.07.22  
                                                             @author: 豆奶  
