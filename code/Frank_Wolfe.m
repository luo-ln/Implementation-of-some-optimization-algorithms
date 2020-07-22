function [iter_num, time, epsilonk] = Frank_Wolfe(nprob, n, x, epsilon, max_iter)
% Frank Wolfe�㷨   2020.06.25
% @author: ����
% �������ܣ�ʵ��Frank Wolfe��   
% ���룺
% nprob: �����ţ� 
% n: ά��
% x: �Ա���x
% epsilon: int, 
% max_iter: ����������
% �����
% iter_num: ��������
% time: ����ʱ��
% epsilonk: KKTϵͳģ������ֵ
t1=clock;   % ��ʱ��ʼ
if nargin==2
    % ��0��ȡ��ʼ��x�;���epsilon
    x = initpt(n, nprob);  % ѡȡ��ʼ��Ҫע���ڿ������� 
    epsilon = 0.0001;
    max_iter = 100;
end
xk = x;
% ����Ŀ�꺯����Լ������
if strcmp(nprob, 'De_Jong')
    f = @(x) sum(x.^2);
    df = @(x) 2.*x;
    g1 =@(x) x+5.12;
    g2 =@(x) 5.12-x;
    g =@(x) [g1(x); g2(x)];
    h =@(x) 0;
elseif strcmp(nprob, 'Rastrigin')
    f = @(x)10*n + sum(x.^2 - 10*cos(2*pi*x));   % nΪ����
    df = @(x) 2*x + 20*pi*sin(2*pi*x);   % f �ĵ���
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
    % ��1������matlab��linprog����������Թ滮���⣨13.8����y
    % ����˵���� linprog(f,A,b,Aeq,beq,LB,UB, X0)  
    y = linprog(dfx,[],[],[],[],lb,ub);% ����Ҫ�ģ�6.22��, �ĺ��ˣ�6.22��
    d = y - xk;
    % ��2���ж��Ƿ�������ֹ����
    if norm(dfx'*d)/(1+norm(f(xk)))<epsilon
        break;
    end
    % ��3������matlab��fmincon���������������ȷ������t
    ft = matlabFunction(f(xk+t*d));  %ͨ��matlabFunction�����ź���ת��Ϊ������������Ϊfmincon�ĵ�һ����������������
    % ����˵���� fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options) %��������������ﲻ��Ҫ
    [t_ans] = fmincon(ft,0.5,[],[],[],[],0,1);  % ����Ҫ�ģ�6.21��  �ĺ��ˣ�6.22��
    xk = xk + t_ans*d;   
end
% ��ȡ���ֵ
iter_num = k;
lambda_g = zeros(2*n, 1);  % ����Frank_Wolfe�㷨û���õ�lagrange��������lambda��Ϊ0
epsilonk = [df(xk); h(xk); min(g(xk), lambda_g)]; 
epsilonk = norm(epsilonk); 
% �������Ч��
%fprintf('\ndf: %5d,   h: %5d,   g: %5d,   xk: %5d\n\n', norm(df(xk)), norm(h(xk)), norm(g(xk)), norm(xk));
t2=clock;
time = etime(t2,t1);
fprintf('\t��������\t\t\t�㷨\t\t���д���\t\t����ʱ��\t\t\tKKTϵͳ����\n');
fprintf('\t%s\t\tFrank_Wolfe\t%5d\t\t%2f\t\t%5d\n', nprob, iter_num, time, epsilonk);
return;
end