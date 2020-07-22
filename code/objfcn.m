function [F] = objfcn(n, x, nprob)
% �������⺯������ֵ   2020.06.15
% @author: ����
% �������ܣ����������x�������ţ����ɶ�Ӧ������ֵ
% ����˵����
% n: ά��
% x: �Ա���x
% nprob: ������
% ���˵���� 
% F: Ŀ�꺯����ֵ
temp = x;
if nprob==21
    temp(1:2:n) = 10*(x(2:2:n) - x(1:2:n).^2);
    temp(2:2:n) = 1 - x(1:2:n);
    F = sum(temp.^2);
elseif nprob==22
    temp(1:4:n) = x(1:4:n) + 10*x(2:4:n);
    temp(2:4:n) = sqrt(5)*(x(3:4:n) - x(4:4:n));
    temp(3:4:n) = (x(2:4:n) - 2*x(3:4:n)).^2;
    temp(4:4:n) = sqrt(10)*(x(3:4:n)-x(4:4:n)).^2;
    F = sum(temp.^2);
elseif nprob==23   
    F = sum((x-1).^2*1e-5) + (sum(x.^2) - 0.25)^2;
elseif nprob==26
    i = 1:n;
    temp = n - sum(cos(x)) + i'.*(1-cos(x))-sin(x);
    F = sum(temp.^2);
elseif nprob==25
    fn1 = [1:n]*(x-1);
    F = sum((x-1).^2) + fn1^2 + fn1^4;
end
end