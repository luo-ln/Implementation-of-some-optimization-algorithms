function [G] = gradfcn(n, x, nprob)
% �������⺯���ĵ�������   2020.06.15
% @author: ����
% �������ܣ����������x�������ţ����ɶ�Ӧ�������ݶ����������ø��Ϻ����󵼷��򣬿�֪G = 2fi*fi'
% ����˵����
% n: ά��
% x: �Ա���x
% nprob: ������
% ���˵���� 
% G: Ŀ�꺯�����ݶ���������СΪ(n, 1)
f = x;
G = x;
if nprob==21
    f(1:2:n) = 10*(x(2:2:n) - x(1:2:n).^2);  % ����ֵfi
    f(2:2:n) = 1 - x(1:2:n);      % (n, 1)
    G(1:2:n) = 2*(-20*f(1:2:n).*x(1:2:n) - f(2:2:n));
    G(2:2:n) = 20*f(1:2:n);
elseif nprob==22
    temp = x;
    temp(1:4:n) = x(1:4:n) + 10*x(2:4:n);   % ����ֵfi
    temp(2:4:n) = sqrt(5)*(x(3:4:n) - x(4:4:n));
    temp(3:4:n) = (x(2:4:n) - 2*x(3:4:n)).^2;
    temp(4:4:n) = sqrt(10)*(x(3:4:n)-x(4:4:n)).^2;
    f(1:4:n) = 2*(temp(1:4:n) + 2*sqrt(10)*temp(4:4:n).*(x(1:4:n)-x(4:4:n)));
    f(2:4:n) = 2*(temp(1:4:n)*10 + temp(3:4:n).*(2*x(2:4:n)-4*x(3:4:n)));
    f(3:4:n) = 2*(temp(2:4:n)*(sqrt(5)) + temp(3:4:n).*(8*x(3:4:n)-4*x(2:4:n)));
    f(4:4:n) = 2*(temp(2:4:n)*(-sqrt(5)) + 2*sqrt(10)*temp(4:4:n).*(x(4:4:n)-x(1:4:n)));
    G = f;
elseif nprob==23
    f1 = sum(x.^2) - 0.25;
    G = 2*(1e-5)*(x-1) + 4*f1*x;
elseif nprob==26
    i = 1:n;
    cosx = cos(x);
    sinx = sin(x);
    dF = n*sinx + i'.*sinx - cosx; 
    f = n - sum(cosx) + i'.*(1-cosx)-sinx;
    G = 2*dF.*f;
elseif nprob==25
    i = 1:n;  % (1, n)
    fn1 = i*(x-1);
    dFn2 = 2*fn1*i';
    G = 2*(x-1)*1 + 2*fn1*i' + 2*fn1^2*dFn2;
end
end
    
