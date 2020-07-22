function [iter_num, time, value] = BFGS(nprob,n, x, epsilon, max_iter)
% BFGS�㷨   2020.06.15
% @author: ����
% �������ܣ�ʵ��BFGS�㷨    
% ���룺
% nprob: �����ţ�22��23��26 
% n: ά��
% x: �Ա���x
% epsilon: int, ����
% max_iter: ����������
% �����
% iter_num: ��������
% time: ����ʱ��
% value: Ŀ�꺯�����ݶȵ�ģ������ֵ
t1=clock;       % ��ʱ��ʼ
% ��1��ȡ��ʼ��x0, ��ʼ�Գƾ���B0. ����
if nargin==2
    x = initpt(n, nprob);
    epsilon = 1e-3;
    max_iter = 500;
end
B = eye(n); % ��λ����
% ��2����f���ݶ�С��epsilon���ý�x
if (norm(gradfcn(n, x, nprob))<=epsilon)
    value = norm(gradfcn(n, x, nprob));
    t2=clock;
    time = etime(t2,t1);
    return;
end
xk = x;
for k=0:max_iter
    % ��3�������Է����飬�ý�dk.
    gx = gradfcn(n, xk, nprob);
    dk = -linsolve(B+0.1*eye(n), gx);  
    %dk = -pinv(B)*gx;  % (n, 1)   
    % ��4������������ȷ������alpha���������Wolfe_Powell
    alpha = Wolfe_Powell(0.01, 0.6, 15, 0.8, 0.6, dk, n, xk, nprob); % step 4
    % ��5������xk�����ж��Ƿ�������ֹ�������������㣬����BFGS������ʽȷ��Bk.
    xk1 = xk + alpha*dk;   % step 5
    gx1 = gradfcn(n, xk1, nprob);
    if (norm(gx1)<=epsilon)
        break;
    end
    % ������2������ʽ���α�54ҳ�Ĺ�ʽ��4.13��
    sk = xk1 - xk; %alpha*dk;  % s_k= x_{k+1}-x_k = alpha*dk   % (n, 1)  xk1 - xk
    yk = gx1 - gx; % (n, 1)
    B = B - (B*(sk*sk')*B)/(sk'*B*sk) + (yk*yk')/(yk'*sk);
    xk = xk1; 
end
% ��ȡ���ֵ
iter_num = k;
value = norm(gx1);
t2=clock;
time = etime(t2,t1);
%fprintf('������\t\t���д���\t\t����ʱ��\t\t\t�����ݶ�\n');
fprintf('\t%2d\t\tBFGS�㷨\t\t%5d\t\t%2f\t\t%5d\n', nprob, iter_num, time, value);
return;
end