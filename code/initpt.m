function [x] = initpt(n, nprob)
% ��ʼ��x  2020.06.15
% @author: ����
% �������ܣ����ɳ�ʼ��
% ���룺
% n: ά��
% nprob: �����ţ�21������
% �����
% x: ��ʼ��x0
x = ones(n, 1); % (n, 1)��С������
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
elseif strcmp(nprob, 'Griewank')   % Լ������
    x = ones(n, 1);
elseif strcmp(nprob, 'De_Jong')   % Լ������
    x = ones(n, 1);  % 5*
elseif strcmp(nprob, 'Rastrigin')   % Լ������
    x = ones(n, 1);   % ����������Ϊ5*��ʱ�򣬺��񲻻�������0������������-3.9798����������Ҳ��һ����Сֵ�ɣ�5.12��F_W�㷨����
end
end