function [iter_num, time, value] = gradient_descent(nprob,n, x, epsilon, max_iter)
% �����½���   2020.06.15
% @author: ����
% �������ܣ�ʵ�������½���
% ���룺
% nprob: �����ţ�21, 22, 23, 25, 26
% n: ά��
% x: �Ա���x
% epsilon: int, 
% max_iter: ����������
% �����
% iter_num: ��������
% time: ����ʱ��
% value: Ŀ�꺯�����ݶȵ�ģ������ֵ
t1=clock;   % ��ʱ��ʼ
% ��1����ʼ����ʼ��x������epsilon>0.
if nargin==2
    x = initpt(n, nprob);
    epsilon = 1e-3;
    max_iter = 500;
end
for iter_num = 0:max_iter
    % ��2����f���ݶȵ�ģС��epsilon����ֹ�㷨. �ý�xk. ���򣬼���dk = -\nabla f(xk).
    if norm(gradfcn(n, x, nprob))<=epsilon
        break;
    end
    d = -gradfcn(n, x, nprob);
    %tic  
    % ��3������������ȷ������alpha���������Wolfe_Powell����������.
    alpha = Wolfe_Powell(0.1, 0.9, 15, 0.2, 0.5, d, n, x, nprob); 
    %toc  %����tic   toc���Լ����������ʱ��
    % ��4������xk
    x = x + alpha*d; 
end
% ��ȡ���ֵ
t2=clock;
value = norm(gradfcn(n, x, nprob));
time = etime(t2,t1);
%fprintf('������\t\t���д���\t\t����ʱ��\t\t\t�����ݶ�\n');
fprintf('\t%2d\t\t�����½���\t\t%5d\t\t%2f\t\t%5d\n', nprob, iter_num, time, value);
return;
end